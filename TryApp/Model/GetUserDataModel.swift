//
//  TryApp
//  Created by 亀山真矢 on 2021/02/26.
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
