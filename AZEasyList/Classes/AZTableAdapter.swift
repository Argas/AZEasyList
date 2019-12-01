//
//  UIView+Xib.swift
//  EasyList
//
//  Created by Alexey Zverev on 01.12.2019.
//

public class AZTableAdapter: NSObject {
    fileprivate var items: [AZAnyModel] = []
    fileprivate var table: UITableView
    
    public init(table: UITableView) {
        self.table = table
    }
    
    public func set(items: [AZAnyModel]) {
        self.items = items
    }
    
    public func reload() {
        table.delegate = self
        table.dataSource = self
        table.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension AZTableAdapter: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. Get right item
        
        let item = items[indexPath.row]
                
        // 2. Creating of the cell
        
        var cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: item.reuseId) {
            cell = reusedCell
        } else {
            tableView.register(item.cellType().self, forCellReuseIdentifier: item.reuseId)
            cell = tableView.dequeueReusableCell(withIdentifier: item.reuseId, for: indexPath)
        }
        
        // 3. Configure cell
        
        if let gc = cell as? CellViewContainer {
            gc.embededUIView.configure(with: item)
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Cell

public protocol CellViewContainer {
    var embededUIView: AZAnyModelConfigurableView { get }
}

public class CellWithGenericContent<View>: UITableViewCell, CellViewContainer where View: AZAnyModelConfigurableView {
    public lazy var embededView: View = View.makeFromNibOrInit()
    public var embededUIView: AZAnyModelConfigurableView { return embededView }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(embededView)
        embededView.translatesAutoresizingMaskIntoConstraints = false
        embededView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        embededView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        embededView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        embededView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
