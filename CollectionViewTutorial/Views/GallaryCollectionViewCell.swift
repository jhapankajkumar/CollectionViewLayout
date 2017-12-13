//
//  GallaryCollectionViewCell.swift
//  CollectionViewTutorial
//
//  Created by Pankaj on 13/12/17.
//  Copyright © 2017 Aleph-Labs. All rights reserved.
//

import UIKit

class GallaryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var caption: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6.0
        containerView.layer.masksToBounds = true
    }
    var gallary : Photo? {
        didSet {
            if let gallaryImage = gallary {
                self.photo.image = gallaryImage.image
                self.comment.text   = gallaryImage.comment
                self.caption.text   = gallaryImage.caption
            }
        }
    }
}
