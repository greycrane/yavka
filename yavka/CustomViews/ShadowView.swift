//
//  ShadowView.swift
//  yavka
//
//  Created by Сергей Журавлёв on 19.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView {
    
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: CGColor {
        set {
            layer.shadowColor = newValue
        }
        get {
            return layer.shadowColor ?? UIColor.black.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
    }
}
