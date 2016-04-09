//
//  ViewController.swift
//  background-image+
//
//  Created by Sadir Abdulhadi on 2/4/16.
//  Copyright (c) 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionReligionThera: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var data="I would rather not say"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["I would rather not say", "Christian", "Muslim", "Hindu", "Jewish", "Sikh", "Buddism", "Folk Religions", "Atheist/No-religion", "Other"]
    }
    
    @IBAction func nextPressed(sender: AnyObject) {
        var index = self.pickerData.indexOf(self.data)
        AnswersTherapists.sharedInstance.score = AnswersTherapists.sharedInstance.score + ((index!-AnswersTherapists.sharedInstance.religion) * 100000)
        AnswersTherapists.sharedInstance.religion = index!
        AnswersTherapists.sharedInstance.answers["Religion"] = self.data        }


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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data = pickerData[row]
    }
    
}

