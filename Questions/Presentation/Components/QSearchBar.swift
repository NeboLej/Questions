//
//  Component.swift
//  Questions
//
//  Created by Nebo on 08.06.2022.
//

import UIKit

//@IBDesignable
class QSearchBar: UITextField {
    
    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor: GetColor( named: "SearchBarPlaceholder" )])
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 48.0)
    }
    
    private var placeholderSize = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialBar()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        editingRect(forBounds: bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        editingRect(forBounds: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 50.0))
    }
    
    private func initialBar() {
        let seatchIconIV = UIImageView(image: UIImage(named: "IconSearch"))
        addSubview(seatchIconIV)
        seatchIconIV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seatchIconIV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20.0),
            seatchIconIV.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            seatchIconIV.heightAnchor.constraint(equalToConstant: 17.0),
            seatchIconIV.widthAnchor.constraint(equalToConstant: 17.0)
        ])
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
