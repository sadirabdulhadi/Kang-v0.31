//
//  pickImage.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 3/6/16.
//  Copyright © 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class moreInfo: UIViewController{
    let ref = Firebase(url: "https://boiling-heat-1824.firebaseio.com")
    var newImage: UIImage!
    
    
    
    @IBOutlet weak var youtubeLink: UITextView!
    @IBOutlet weak var bio: UITextView!
   
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
    
            
            AnswersTherapists.sharedInstance.answers["Description"] = bio.text
            AnswersTherapists.sharedInstance.answers["YoutubeLink"] = youtubeLink.text
            
        }
    }
    
    
    
    

