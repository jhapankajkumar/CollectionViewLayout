//
//  GallaryCollectionViewLayout.swift
//  CollectionViewTutorial
//
//  Created by Pankaj on 13/12/17.
//  Copyright © 2017 Aleph-Labs. All rights reserved.
//

import UIKit

protocol GallaryLayOutDelegate: class  {
     func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

class GallaryCollectionViewLayout: UICollectionViewLayout {

   weak var delegate: GallaryLayOutDelegate!
    
    fileprivate var numberOfColums = 2
    fileprivate var cellPadding:CGFloat = 5.0
    
    fileprivate var cache =  [UICollectionViewLayoutAttributes]()
    fileprivate var contentHeight:CGFloat = 0
    fileprivate var contentWidht: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return (collectionView.bounds.size.width - (insets.left + insets.right))
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidht, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        let columnWidth:CGFloat = contentWidht/CGFloat(numberOfColums)
        
        var xOffset = [CGFloat]()
        
        for column in 0 ..< numberOfColums {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColums)
        
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = NSIndexPath(item: item, section: 0)
            
            
            let photoHeight = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath as IndexPath)
            
            let height = cellPadding * 2 + photoHeight
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            
            attributes.frame = insetFrame
            
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColums - 1) ? column + 1 : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}
















