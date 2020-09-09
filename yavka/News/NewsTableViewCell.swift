//
//  NewsTableViewCell.swift
//  yavka
//
//  Created by Сергей Журавлёв on 05.09.2020.
//  Copyright © 2020 Сергей Журавлёв. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    var likesCount = 0
    var commentsCount = 0

    @IBOutlet weak var newsAvatarImageView: UIImageView!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var repostButton: UIButton!
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if likesCount == 0 {
            likesCount += 1
            likeCountLabel.text = String(likesCount)
            likeCountLabel.textColor = .red
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
        } else {
            likesCount -= 1
            likeCountLabel.text = String(likesCount)
            likeCountLabel.textColor = .black
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .black
        }
    }
    
    @IBAction func commentButtonPressed(_ sender: Any) {
        if commentsCount == 0 {
            commentsCount += 1
            commentCountLabel.text = String(commentsCount)
            commentButton.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
        } else {
            commentsCount -= 1
            commentCountLabel.text = String(commentsCount)
            commentButton.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        }
    }
    
    @IBAction func repostButtonPressed(_ sender: Any) {
        if repostButton.image(for: .normal) == UIImage(systemName: "arrowshape.turn.up.right") {
            repostButton.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
        } else {
            repostButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsAvatarImageView.layer.cornerRadius = newsAvatarImageView.frame.size.width / 2
        newsAvatarImageView.clipsToBounds = true
    }

    func configure(for model: News) {
        newsAvatarImageView.image = UIImage(named: model.newsAvatarImageName)
        newsAuthorLabel.text = model.newsAuthorName
        newsDateLabel.text = model.newsDate
        newsTextLabel.text = model.newsText
        newsImageView.image = UIImage(named: model.newsPhotoName)
    }
}
