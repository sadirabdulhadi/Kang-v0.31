//
//  pickImage.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 3/6/16.
//  Copyright © 2016 UCL. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class PickImage: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    let ref = Firebase(url: "https://boiling-heat-1824.firebaseio.com")
    var newImage: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBAction func uploadPicture(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            newImage = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        self.ref.authUser(LoggedInInfo.sharedInstance.username, password:LoggedInInfo.sharedInstance.pass) {
            error, authData in
            if error != nil {
                print("error")
            } else {
                if self.newImage != nil {
                var imageData: NSData = UIImageJPEGRepresentation(self.newImage,0.1)!
                AnswersTherapists.sharedInstance.answers["Image"] = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)

                }
            }}}
    
    
    
}


