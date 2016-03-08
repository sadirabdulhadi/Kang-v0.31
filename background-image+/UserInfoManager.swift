//
//  userInfoManager.swift
//  Kang
//
//  Created by Sadir Abdulhadi on 2/25/16.
//  Copyright © 2016 UCL. All rights reserved.
//

import Foundation
import RealmSwift

class UserInfoManager : Object{
    dynamic var username = ""
    dynamic var password = ""
    func setUserInfo (usernamev : String, passwordv : String) -> (){
        username = usernamev
        password = passwordv
    }
    func getUserUsername() -> (String){
        return username
    }
    func getUserPassword() -> (String){
        return password
    }
    
}