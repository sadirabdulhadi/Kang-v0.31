//
//  LoggedInInfo.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 2/27/16.
//  Copyright © 2016 UCL. All rights reserved.
//
private let _SingletonSharedInstance = LoggedInInfo()

class LoggedInInfo  {
    var username = ""
    var pass = ""
    var score = 0
    
    class var sharedInstance : LoggedInInfo {
        return _SingletonSharedInstance
    }
    
}
