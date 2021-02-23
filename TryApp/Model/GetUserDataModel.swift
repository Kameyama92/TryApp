//
//  GetUserDataModel.swift
//  Swift6BMIApp1
//
//  Created by Yuta Fujii on 2021/02/01.
//

import Foundation

class GetUserDataModel {
    
    
  static func getUserData(key:String)->String{
        var result = String()
        if UserDefaults.standard.object(forKey: key) != nil{
            
            result = UserDefaults.standard.object(forKey: key) as! String
            
        }
        
        return result
    }
    
}
