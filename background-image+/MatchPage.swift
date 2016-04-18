//
//  MatchPage.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 4/9/16.
//  Copyright © 2016 UCL. All rights reserved.
//
import UIKit


class MatchPage: UIViewController {
    var indexo = 0
    var matchesArray = [[String]]()
    
    @IBOutlet weak var imageOfTherapist: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    var namex = 3
    var phonex = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(matchesArray)
        matchesArray = OldAnswersPatients.sharedInstance.matches
        nameLabel.text=matchesArray[indexo][namex]
        phoneLabel.text=matchesArray[indexo][phonex]
        
        
        
        let decodedData = NSData(base64EncodedString: matchesArray[indexo][6], options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        
        let decodedImage = UIImage(data: decodedData!)

        imageOfTherapist.image = decodedImage
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            viewDidLoad()
            indexo = max(0, indexo-1)
            //nameLabel.text=matchesArray[indexo][namex]
           // phoneLabel.text=matchesArray[indexo][phonex]
            
        }
        
        if (sender.direction == .Left) {
            indexo = min(self.matchesArray.endIndex-1, indexo+1)
            //nameLabel.text=matchesArray[indexo][namex]
            //phoneLabel.text=matchesArray[indexo][phonex]
            viewDidLoad()
        }
    }}