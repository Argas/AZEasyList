//
//  UIView+Xib.swift
//  EasyList
//
//  Created by Alexey Zverev on 01.12.2019.
//

public struct AZAnyModelsCollection {
    private var models: [AZAnyModel] = []
    
    mutating public func append<T>(model: T) where T: AZModel, T == T.View.Model {
        models.append(model)
    }
    
    public var isEmpty: Bool {
        return models.isEmpty
    }
    
    public mutating func popView() -> UIView? {
        guard models.count > 0 else { return nil }
        
        let last = models.removeLast()
        return ViewMaker.makeView(with: last)
    }
}
