//
//  Render.swift
//  EasyList
//
//  Created by Alexey Zverev on 26.11.2019.
//  Copyright © 2019 Alexey Zverev. All rights reserved.
//
import UIKit

// MARK: - View

public typealias AZView = UIView & AZConfigurable & AZAnyModelConfigurableView

public protocol AZConfigurable {
    associatedtype Model: ViewAssociateable
    func configure(with model: Model)
}

public protocol AZAnyModelConfigurableView: UIView {
    func configure(with: AZAnyModel)
}

extension AZAnyModelConfigurableView where Self: UIView, Self: AZConfigurable {
    public func configure(with item: AZAnyModel) {
        guard let model = item as? Self.Model else {
            assert(false, "model is not \"\(Self.Model.self)\" type")
            return
        }
        self.configure(with: model)
    }
}

// MARK: - Model

public typealias AZModel = ViewAssociateable & AZAnyModel

public protocol ViewAssociateable {
    associatedtype View: UIView where View: AZConfigurable
}

public typealias AZAction = () -> Void

public protocol AZActionAvailable {
    var tapAction: AZAction { get set}
}

public protocol AZAnyModel {
    func cellType() -> UITableViewCell.Type
    func viewType() -> UIView.Type
    var reuseId: String { get }
}

public extension AZAnyModel where Self: ViewAssociateable, Self.View: AZAnyModelConfigurableView, Self.View.Model == Self {
    
    func cellType() -> UITableViewCell.Type {
        return CellWithGenericContent<Self.View>.self
    }
    
    func viewType() -> UIView.Type {
        return Self.View.self
    }
    
    var reuseId: String {
        return TypeDescriptor.key(from: self)
    }
}

// MARK: - Utils

public final class TypeDescriptor {
    public static func key(from item: Any) -> String {
        return String(reflecting: type(of: item))
    }
}

final class ViewMaker {
    public static func makeView(with component: AZAnyModel) -> AZAnyModelConfigurableView {
        let type = component.viewType()
        let view = type.canBeLoadedFromNib() ? type.makeFromNib() : type.init(frame: .zero)
        guard let result = view as? AZAnyModelConfigurableView else {
            fatalError("view isn't AZView. It doesn't confirm AZAnyModelConfigurableView")
        }
        
        return result
    }
}
//
//extension AZAnyModel {
//    mutating func make(tap: @escaping Action) {
//        let t = Tap(tapAction: tap, model: self)
////        self = t
//    }
//}
//
//struct Tap {
//    var tapAction: Action?
//    var model: AZAnyModel
//}
