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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* signUpAsTherapistButton.layer.cornerRadius = 10*/
        
        // Do any additional setup after loading the view, typically from a nib.
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
                self.displayAlertMessage("success")
                print(ref.authData)
            }
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

