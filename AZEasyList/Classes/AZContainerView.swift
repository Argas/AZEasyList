//
//  UIView+Xib.swift
//  EasyList
//
//  Created by Alexey Zverev on 01.12.2019.
//

/** The container can be used in Views with generic content. Any variable part of your view can be declared
 
Example:
 ```
 class MyBlockView: AZView {
     
     @IBOutlet weak var title: UILabel!
     
     // you can place any content here
     @IBOutlet weak var container: AZContainerView!
     
     func configure(with model: Model) {
         title?.text = model.title
         container.configure(with: model.container)
     }
     
     struct Model: AZModel {
         typealias View = MyBlockView
         
         var title: String
         
         // you can use any AZAnyModel for your content
         var container: AZAnyModel
         
         // Without this reimplementation `MyBlockView` with content type `A` and with content type `B` will be reuse in table view,
         // and new content view will be created each time
         var reuseId: String {
             return TypeDescriptor.key(from: self) + container.reuseId
         }
     }
 }
```
*/
final public class AZContainerView: UIView {
    
    /// Returns content view, if it exists
    private(set) public var content: AZAnyModelConfigurableView?
    
    /// Removes content from container
    public func clear() {
        content?.removeFromSuperview()
    }
    
    /// Places view into the container and creates constrains to pin it to the edges of the container
    public func place(content: AZAnyModelConfigurableView) {
        self.content?.removeFromSuperview()
        self.content = content
        self.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        content.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    /// Updates content of the conteiner with a new model.
    /// If the model has the same type as a type of current model - it just updates the model
    /// if there is no content or content has distinct type from the model - it creates a new view and place it in container.
    public func configure(with model: AZAnyModel) {
        if let content = content, type(of: content) == model.viewType() {
            content.configure(with: model)
        } else {
            place(content: ViewMaker.makeView(with: model))
        }
    }
}
