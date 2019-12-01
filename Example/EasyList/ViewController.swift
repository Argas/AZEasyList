//
//  ViewController.swift
//  EasyList
//
//  Created by Alexey Zverev.91@gmail.com on 12/01/2019.
//  Copyright (c) 2019 Alexey Zverev.91@gmail.com. All rights reserved.
//

import UIKit
import AZEasyList

final class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    // 1. Create the adapter from the table
    private lazy var adapter = AZTableAdapter(table: table)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3. Set Models
        adapter.set(items: itms)
        
        // 4. Reload table
        adapter.reload()
    }
    
    // 2. Create Models
    var itms: [AZAnyModel] {
        var arr: [AZAnyModel] = []
        for i in 0..<100 {
            let content: AZAnyModel = i%3 == 0 ? NestedView.Model(text: "blah") : NestedView2.Model()
            let model = MyBlockView.Model(title: "Заголовок №\(i)", container: content)
            
            arr.append(model)
        }
        
        return arr
    }
}

// MARK: - Examples

class MyBlockView: AZView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var container: AZContainerView!
    
    func configure(with model: Model) {
        title?.text = model.title
        container.configure(with: model.container)
    }
    
    struct Model: AZModel {
        typealias View = MyBlockView
        
        var title: String
        var container: AZAnyModel
        var reuseId: String {
            return TypeDescriptor.key(from: self) + container.reuseId
        }
    }
}


class NestedView: AZView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with model: Model) {  }
    
    struct Model: AZModel {
        public typealias View = NestedView
        
        //
        var text = "as2d"
    }
}



class NestedView2: AZView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with model: Model) { }
    
    struct Model: AZModel {
        public typealias View = NestedView2
    }

}

