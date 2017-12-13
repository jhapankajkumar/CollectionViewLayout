//
//  CVPhoto.swift
//  CollectionViewTutorial
//
//  Created by Pankaj on 13/12/17.
//  Copyright © 2017 Aleph-Labs. All rights reserved.
//

import UIKit

struct Photo {
    
    var image:UIImage!
    var caption:String!
    var comment:String!
    
    init(caption: String, withComment comment: String, withImage image: UIImage) {
        self.image = image
        self.caption = caption
        self.comment = comment
    }
    
    init?(dictionary: [String : String]) {
        guard let caption = dictionary["caption"], let comment = dictionary["comment"], let imageName = dictionary["image"], let image  = UIImage(named: imageName)  else {
            return nil
        }
        self.init(caption: caption, withComment: comment, withImage: image)
    }
}
