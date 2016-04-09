//
//  SignUpThera.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 3/2/16.
//  Copyright © 2016 UCL. All rights reserved.

import UIKit
import Firebase

class signUpThera: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var repassField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var membershipField: UITextField!
    var name = ""
    var email = ""
    var password = ""
    var repeatPassword = ""
    var phone = ""
    var membership = ""
    
    let ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if ( (emailField.text == "") || (passField.text == "") || (repassField.text == "") || (nameField.text == "") ||
            (phoneField.text == "") || (membershipField.text == "")){
            return false
        }
        else {return true}
    }


    @IBAction func backButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("lastPage", sender: nil)
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        
        name = nameField.text!
        email = emailField.text!
        password = passField.text!
        repeatPassword = repassField.text!
        phone = phoneField.text!
        membership = membershipField.text!
        
        
        //check for empty fields
        
        if (name.isEmpty || email.isEmpty || password.isEmpty || repeatPassword.isEmpty || phone.isEmpty || membership.isEmpty ) {
            displayAlertMessage("One of the fields is empty")
            return
        }
            
            // check passwords match
            
        else if (password != repeatPassword){
            //display alert message
            displayAlertMessage("Passwords don't match")
            return
        }
            
        else{
            
            ref.createUser(email, password: password,
                withValueCompletionBlock: { error, result in
                    if error != nil {
                        self.displayAlertMessage("error")
                    } else {
                        // ViewController.giveEmail(userEmail)
                        
                        
                        self.ref.authUser(self.email, password: self.password) {
                            error, authData in
                            if error != nil {
                                // Something went wrong. :(
                            } else {
                                LoggedInInfo.sharedInstance.username=self.email
                                LoggedInInfo.sharedInstance.pass=self.password
                                AnswersTherapists.sharedInstance.answers["Name"] = self.name
                                AnswersTherapists.sharedInstance.answers["Email"] = self.email
                                AnswersTherapists.sharedInstance.answers["Phone"] = self.phone
                                AnswersTherapists.sharedInstance.answers["Membership"] = self.membership
                                self.performSegueWithIdentifier("nextPage", sender: nil)}
                        }                    }
                    
                    
            })
            performSegueWithIdentifier("nextPage", sender: nil)
            //store data
            //display alert message with confirmation
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayAlertMessage(messageText:String){
        let myAlert = UIAlertController(title: "Alert", message:messageText, preferredStyle: .Alert);
        let  okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler:nil)
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
}



