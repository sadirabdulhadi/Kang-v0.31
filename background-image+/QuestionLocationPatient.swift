//
//  QuestionLocationPatient.swift
//  Kang
//
//  Created by Reemma Muthal Puredath on 06/03/2016.
//  Copyright © 2016 UCL. All rights reserved.
//

import UIKit
import Firebase

class QuestionLocationPatient: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var ref = Firebase(url:"https://boiling-heat-1824.firebaseio.com")
    var data="North London"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["North London", "South London", "East London", "West London", "Central London" ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextPressed(sender: AnyObject) {
                var index = self.pickerData.indexOf(self.data)
                OldAnswersPatients.sharedInstance.score = OldAnswersPatients.sharedInstance.score + ((index!-OldAnswersPatients.sharedInstance.location) * 10)
                OldAnswersPatients.sharedInstance.location = index!
                OldAnswersPatients.sharedInstance.answers["Location"] = self.data
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

