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
    @IBOutlet weak var emailLabel: UILabel!
    let namex = 9
    let phonex = 10
    let emailx = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (matchesArray.endIndex != 0){
        matchesArray = OldAnswersPatients.sharedInstance.matches
        nameLabel.text=matchesArray[indexo][namex]
        phoneLabel.text="Phone number : " + matchesArray[indexo][phonex]
        emailLabel.text="Email : " + matchesArray[indexo][emailx]
        print(matchesArray[indexo][namex])
        
        
        
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
        else { displayAlertMessage("No matches / error. Press 'take the test again'")
        }}
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            viewDidLoad()
            indexo = max(0, indexo-1)
            
        }
        
        if (sender.direction == .Left) {
            indexo = min(self.matchesArray.endIndex-1, indexo+1)
            viewDidLoad()
        }
    }


func displayAlertMessage(messageText:String){
    let myAlert = UIAlertController(title: "Alert", message:messageText, preferredStyle: .Alert);
    let  okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler:nil)
    myAlert.addAction(okAction)
    
    self.presentViewController(myAlert, animated: true, completion: nil)
    
    }}
