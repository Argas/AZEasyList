//
//  UIView+Xib.swift
//  EasyList
//
//  Created by Alexey Zverev on 01.12.2019.
//

import Foundation

public protocol ViewFromNibLoadable {}
extension UIView: ViewFromNibLoadable {}
public extension ViewFromNibLoadable where Self: UIView {
    static func makeFromNibOrInit() -> Self {
        return canBeLoadedFromNib() ? makeFromNib() : Self.init(frame: .zero)
    }
    
    static func canBeLoadedFromNib() -> Bool {
        let bundle = Bundle(for: self)
        return bundle.path(forResource: nibName, ofType: "nib") != nil
    }
    
    static func makeFromNib() -> Self {
        let bundle = Bundle(for: self)
        
        guard let viewFromNib = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? Self else {
            fatalError("Can't load Nib with name \(nibName)")
        }
        return viewFromNib
    }
    
    private static var nibName: String {
        var result = String(describing: self).components(separatedBy: ".").last ?? ""
        if let index = result.firstIndex(of: "<") {
            result = String(result[..<index])
        }
        return result
    }
}
