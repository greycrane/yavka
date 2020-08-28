//
//  AvatarImageView.swift
//  yavka
//
//  Created by Сергей Журавлёв on 19.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

@IBDesignable class AvatarImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
