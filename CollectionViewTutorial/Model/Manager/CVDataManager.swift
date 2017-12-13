//
//  CVDataManager.swift
//  CollectionViewTutorial
//
//  Created by Pankaj on 13/12/17.
//  Copyright © 2017 Aleph-Labs. All rights reserved.
//

import UIKit

class CVDataManager: NSObject {

    
    static let sharedInstance = CVDataManager()
    
    func getAllPhotos() -> [Photo] {
        
        let photo = Photo(caption: "VCON?",
                          withComment: "Is Ray hinting that perhaps it's Vicki's turn next year?",
                          withImage: UIImage(named: "1")!)
        let photo1 = Photo(caption: "Little and Large",
                           withComment: "Brian and Matt meet for the very first time.",
                           withImage: UIImage(named: "2")!)
        let photo2 = Photo(caption: "Shiny Happy People",
                           withComment: "There are so many happy people at RWDevCon - it's amazing.",
                           withImage: UIImage(named: "3")!)
        let photo3 = Photo(caption: "Need More Lanyards",
                           withComment: "The moment it all became very real. The conference really was happening!",
                           withImage: UIImage(named: "4")!)
        let photo4 = Photo(caption: "Thank You Sponsors",
                           withComment: "Without you we wouldn't have been able to put on this amazing conference.",
                           withImage: UIImage(named: "5")!)
        
        let photo5 = Photo(caption: "TUTORIAL TEAM ASSEMBLE!",
                           withComment: "The Avengers certainly have nothing on this lot!",
                           withImage: UIImage(named: "6")!)
        let photo6 = Photo(caption: "But, But, Delegates",
                           withComment: "\"Matthijs, stop going on about architecture, we're trying to eat!\"",
                           withImage: UIImage(named: "7")!)
        let photo7 = Photo(caption: "Lunch",
                           withComment: "Mic and Greg grab a quick bite to eat between WatchKit sessions.",
                           withImage: UIImage(named: "8")!)
        let photo8 = Photo(caption: "One More Thing...",
                           withComment: "The attendees eaglery awaiting the final big announcement.",
                           withImage: UIImage(named: "9")!)
        let photo9 = Photo(caption: "Milan Beckoning Marin",
                           withComment: "Check out Marin's new catalogue pose!",
                           withImage: UIImage(named: "10")!)
        let photo10 = Photo(caption: "Shiver Me Timbers!",
                            withComment: "Meet Christine, the world's least terrifying pirate.",
                            withImage: UIImage(named: "11")!)
        let photo11 = Photo(caption: "We're Jammin'",
                            withComment: "An impromptu ukulele jamming session in the bar with Tim and Tammy.",
                            withImage: UIImage(named: "12")!)
        let photo12 = Photo(caption: "Busted!",
                            withComment: "That's right Saul, we caught you napping.",
                            withImage: UIImage(named: "13")!)
        
        var photos =  [Photo]()
        
        photos.append(photo)
        photos.append(photo1)
        photos.append(photo2)
        photos.append(photo3)
        photos.append(photo4)
        photos.append(photo5)
        photos.append(photo6)
        photos.append(photo7)
        photos.append(photo8)
        photos.append(photo9)
        photos.append(photo10)
        photos.append(photo11)
        photos.append(photo12)
        
        return photos
    }
}
