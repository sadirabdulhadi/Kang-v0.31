//
//  signUpPage.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/7/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//
import UIKit
import RealmSwift
import Firebase


class signUpPage: UIViewController {
    var userEmail = ""
    var password = ""
    var repeatPassword = ""
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    //text fields
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var repassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if ( (emailField.text == "") || (emailField.text == "UCL email") || (passField.text == "") || (passField.text == "Password") || (repassField.text == "") || (repassField.text == "Retype Password") || (passField.text != repassField.text)){
                return false
        }
        else {return true}
    }
    @IBAction func backButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("lastPage", sender: nil)
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {

        
        userEmail = emailField.text!
        password = passField.text!
        repeatPassword = repassField.text!
        
        
        //check for empty fields
        
        if (userEmail.isEmpty || (userEmail == "UCL email") || password.isEmpty || password=="Password" || repeatPassword.isEmpty || repeatPassword=="Retype Passowrd") {
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

            ref.createUser(userEmail, password: password,
                withValueCompletionBlock: { error, result in
                    if error != nil {
                    self.displayAlertMessage("error")
                    } else {
                       // ViewController.giveEmail(userEmail)
                        
                        
                        self.ref.authUser(self.userEmail, password: self.password) {
                            error, authData in
                            if error != nil {
                                // Something went wrong. :(
                            } else {
                                LoggedInInfo.sharedInstance.username=self.userEmail
                                LoggedInInfo.sharedInstance.pass=self.password

                                let newUser = ["email": self.userEmail]
                                let usersRef = self.ref.childByAppendingPath("users").childByAppendingPath("patients").childByAppendingPath(authData.uid)
                                usersRef.updateChildValues(newUser)
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


