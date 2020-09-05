//
//  FriendTableViewCell.swift
//  yavka
//
//  Created by Сергей Журавлёв on 11.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

@IBDesignable class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
//    @IBInspectable var shadowRadius: CGFloat = 10.0 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var shadowColor: CGColor = UIColor.black.cgColor {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var shadowOpacity: CGFloat = 0.5 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true
        shadowView.layer.cornerRadius = shadowView.frame.size.width / 2
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize.zero
    }
    
    func configure(for model: Friend) {
        nameLabel.text = model.friendName
        avatarImageView.image = UIImage(named: model.friendAvatarName)
    }
}
