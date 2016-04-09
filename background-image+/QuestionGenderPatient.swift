//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionGenderPatient: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var picker: UIPickerView!
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var data="I don't mind"
    var pickerData: [String] = [String]()
    var oldAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["I don't mind", "Male", "Female", "Transgendered (male to female)","Transgendered (female to male)"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBAction func pressedNext(sender: AnyObject) {

                var index = self.pickerData.indexOf(self.data)
                OldAnswersPatients.sharedInstance.score = OldAnswersPatients.sharedInstance.score + ((index!-OldAnswersPatients.sharedInstance.gender) * 10000)
                OldAnswersPatients.sharedInstance.gender = index!
 
                OldAnswersPatients.sharedInstance.answers["Gender"] = self.data
        }

        
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data = pickerData[row]
    }
    
    
}

