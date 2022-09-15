//
//  Extension.swift
//  Questions
//
//  Created by Nebo on 08.06.2022.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue }
        get {
            return layer.cornerRadius }
    }
    
    @IBInspectable
    var cornerLeftTop: Bool {
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
        get { false }
    }
    
    @IBInspectable
    var cornerRightTop: Bool {
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
        get { false }
    }
    
    @IBInspectable
    var cornerRightBottom: Bool {
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
        get { false }
    }
    
    @IBInspectable
    var cornerLeftBottom: Bool {
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
        get { false }
    }
    
    //MARK: - Shadow
    @IBInspectable
    var shadowColor: UIColor? {
        set {
            if let rColor = newValue {
                layer.shadowColor = rColor.cgColor;
            }
        }
        get { return nil; }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue/100.0; }
        get { return 0.0; }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue; }
        get { return CGSize(); }
    }
    
    
    
    @IBInspectable
    var shadowRadius: CGFloat {
        
        set { layer.shadowRadius = newValue; }
        get { return 0.0; }
    }
    
    //MARK: - Border
    @IBInspectable
    var borderWidth: CGFloat {
        set { layer.borderWidth = newValue/UIScreen.main.scale; }
        get { return 0.0; }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        set {
            if let rColor = newValue {
                layer.borderColor = rColor.cgColor;
            }
        }
        get { return nil; }
    }
    
    func GetColor(named: String) -> UIColor {
        UIColor(named: named, in: Bundle( for: type( of: self )), compatibleWith: nil)!
    }
    
    func GetImage(named: String, template: Bool = false) -> UIImage {
        let image = UIImage(named: named, in: Bundle(for: type(of: self)), compatibleWith: nil)!
        return template ? image.withRenderingMode(.alwaysTemplate) : image
    }
    
    func HideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

