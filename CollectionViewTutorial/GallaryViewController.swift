//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by Pankaj on 13/12/17.
//  Copyright © 2017 Aleph-Labs. All rights reserved.
//

import UIKit

class GallaryViewController: UIViewController {

    @IBOutlet weak var gallaryCollectionView: UICollectionView!
    var photos = [Photo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        photos = CVDataManager.sharedInstance.getAllPhotos()
        
        gallaryCollectionView?.backgroundColor = .clear
        gallaryCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
        if let layout = gallaryCollectionView.collectionViewLayout as? GallaryCollectionViewLayout {
            layout.delegate = self
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension GallaryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "gallaryCell", for: indexPath) as! GallaryCollectionViewCell
        collectionViewCell.gallary = photos[indexPath.item]
        return collectionViewCell
    }
}


extension GallaryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize + 0)
    }
    
}

extension GallaryViewController : GallaryLayOutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return photos[indexPath.item].image.size.height
    }
    
}










