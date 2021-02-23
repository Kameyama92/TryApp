//
//  GetDateModel.swift
//  Swift6BMIApp1
//
//  Created by Yuta Fujii on 2021/02/01.
//

import Foundation

class GetDateModel {
    
//    var getUserDataModel = GetUserDataModel()
    
    
    //今日の日付を取得して、返す
   static func getTodayDate(slash:Bool)->String{
        
        let f = DateFormatter()
        f.timeStyle = .none
        f.dateStyle = .full
        
        // 1999/4/12
        if slash == true{
            f.dateFormat = "yyyy/MM/dd"
        }
        
        f.locale = Locale(identifier: "ja_JP")
        let now = Date()
        
        return f.string(from: now)
        
    }
    
    //適正体重を返してくれるメソッドを作成
    
    func calcBetterWeight()->String{
        
        //適正体重 = 身長の二乗 * 22
        
        var betterWeight = pow(Double(GetUserDataModel.getUserData(key: "height"))!/100.00,2) * 22
        
        betterWeight = round(betterWeight*10)/10
        return String(betterWeight)
        
        
        
    }
    
    
}
