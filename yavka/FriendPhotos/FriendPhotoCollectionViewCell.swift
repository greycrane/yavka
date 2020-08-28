//
//  FriendPhotoCollectionViewCell.swift
//  yavka
//
//  Created by Сергей Журавлёв on 11.08.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

class FriendPhotoCollectionViewCell: UICollectionViewCell {
    var likesCount = 0
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func likeButtonPressed(_ sender: Any) {
        if likesCount == 0 {
            likesCount += 1
            likesCountLabel.text = String(likesCount)
            likesCountLabel.textColor = .red
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
        } else {
            likesCount -= 1
            likesCountLabel.text = String(likesCount)
            likesCountLabel.textColor = .black
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .black
        }
        
        
    }
}
