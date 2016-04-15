//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class Login: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var username = ""
    var pass = ""
    var score = String()
    var temp = [[String]]()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logInPressed(sender: AnyObject) {
        username = email.text!
        pass = password.text!
        let ref = Firebase(url: "https://boiling-heat-1824.firebaseio.com")
        ref.authUser(username, password: pass){
            error, authData in
            if error != nil {
                // an error occured while attempting login
            } else {
                LoggedInInfo.sharedInstance.username=self.username
                LoggedInInfo.sharedInstance.pass=self.pass
                print(ref.authData)
                let usersRef = ref.childByAppendingPath("users").childByAppendingPath("patients").childByAppendingPath(authData.uid)
                let refpsy = Firebase(url:"https://boiling-heat-1824.firebaseio.com/users/therapists")
                
                //step A : find the path to score
                let userScorePath = usersRef.childByAppendingPath("Score")
                
                //step B : grab the value of score
                userScorePath.observeEventType(.Value, withBlock: { snapshot in
                    self.score = String(snapshot.value)
                    }, withCancelBlock: { error in
                        print(error.description)
                })


                var matching = refpsy.queryOrderedByChild("Score").queryEqualToValue(self.score)
                
                matching.observeEventType(.ChildAdded, withBlock: { snapshot in
                    var tempItems = [String]()
                    
                    for item in snapshot.children.allObjects as! [FDataSnapshot] {
                        let dict = item.value as! (String)
                        tempItems.append(dict)
                    }
                    
                    self.temp.append(tempItems)
                    print(snapshot)
                    OldAnswersPatients.sharedInstance.matches = self.temp
                    
                })
            }
            self.displayAlertMessage("success")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertMessage(messageText:String){
        let myAlert = UIAlertController(title: "Alert", message:messageText, preferredStyle: .Alert);
        let  okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler:nil)
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }

    
    
}

