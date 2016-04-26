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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var youtubeLabel: UILabel!
    
    @IBOutlet weak var expertiseLabel: UILabel!
    @IBOutlet weak var childhood: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    let namex = 10
    let phonex = 11
    let emailx = 4
    let locationx = 8
    let descriptionx = 2
    let youtubex = 14
    let genderx = 6
    let membershipx = 9
    let childhoodx = 0
    let expertisex = 5
    let costx = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchesArray = OldAnswersPatients.sharedInstance.matches
        
        if (!matchesArray.isEmpty) {
            print(matchesArray)
            print(matchesArray.endIndex)
            print(indexo)
            
        
        nameLabel.text=matchesArray[indexo][namex] + ", "+matchesArray[indexo][locationx]+", Membership number : " + matchesArray[indexo][membershipx]
        youtubeLabel.text="My video link: " + matchesArray[indexo][youtubex]
        descriptionLabel.text = "Description : " + matchesArray[indexo][descriptionx]
        phoneLabel.text="Phone number : " + matchesArray[indexo][phonex]
        emailLabel.text="Email : " + matchesArray[indexo][emailx]
        genderLabel.text = "Gender : " + matchesArray[indexo][genderx]
        childhood.text="Interest in childhood : " + (matchesArray[indexo][childhoodx]) + "/7"
        expertiseLabel.text = "Expertise : " + matchesArray[indexo][expertisex]
        costLabel.text = "Cost : " + matchesArray[indexo][costx] + "£"
        
        print(matchesArray[indexo][namex])
        
        
        
        let decodedData = NSData(base64EncodedString: matchesArray[indexo][7], options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        
        let decodedImage = UIImage(data: decodedData!)

        imageOfTherapist.image = decodedImage
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        }
        else{
            print(matchesArray.endIndex)
            print(indexo)
            nameLabel.text = "No match found"
            youtubeLabel.text=""
            descriptionLabel.text = ""
            phoneLabel.text=""
            emailLabel.text=""
            genderLabel.text = ""
            childhood.text = ""
            expertiseLabel.text = ""
            costLabel.text = ""


        }
    }

    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            viewDidLoad()
            indexo = max(0, indexo-1)
            print(indexo)
            viewDidLoad()
            
        }
        
        if (sender.direction == .Left) {
            indexo = min(self.matchesArray.endIndex-1, indexo+1)
            print(indexo)
            viewDidLoad()
        }
    }


func displayAlertMessage(messageText:String){
    let myAlert = UIAlertController(title: "Alert", message:messageText, preferredStyle: .Alert);
    let  okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler:nil)
    myAlert.addAction(okAction)
    
    self.presentViewController(myAlert, animated: true, completion: nil)
    
    }
}

