//
//  oldAnswers.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 4/5/16.
//  Copyright © 2016 UCL. All rights reserved.
//

import Foundation

private let _SingletonSharedInstance = OldAnswersPatients()
class OldAnswersPatients{

    var location = 0
    var cost = 0
    var directive = 0
    var religion = 0
    var gender = 0
    var childhood = 0
    var expertise = 0
    var answers=[String: String]()
    var score = 0
    var matches =  [[String]]()
    var literal_score = ""

    
    class var sharedInstance : OldAnswersPatients {
        return _SingletonSharedInstance
    }
    
    
}