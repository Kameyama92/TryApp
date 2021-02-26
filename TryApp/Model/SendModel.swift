//
//  SendModel.swift
//  TryApp
//  Created by 亀山真矢 on 2021/02/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class SendModel {
    
    let db = Firestore.firestore()
    
    func sendTodayWeightToDB(userName:String,weight:String){
        
        //現在時刻を取得
        
        var date = GetDateModel.getTodayDate(slash:true)
    
        //年月→collectionIDとして
        for i in 0...1{
            
            if let slash = date.range(of: "/"){
                
                date.replaceSubrange(slash, with: "")
                print(date)
                
            }
            
        }
        let collectionID = date.prefix(6)
        let documentID = date.suffix(2)
        
    
        //日→ドキュメントIDとして
        
        //はじめてアプリを立ち上げたとき
        if UserDefaults.standard.object(forKey: "today") != nil{
            
            
        }else{
            
            //はじめてのとき
            UserDefaults.standard.setValue(date, forKey: "today")
            UserDefaults.standard.setValue(1, forKey: "done")
            
        }
        
        //今日はまだ送信していない
        if UserDefaults.standard.object(forKey: "today") as! String != date{
            
            db.collection("Users").document(Auth.auth().currentUser!.uid).collection(String(collectionID)).document(String(documentID)).setData(
            
                ["userName":userName,"userID":Auth.auth().currentUser!.uid,"weight":weight,"date":Date().timeIntervalSince1970]
            )
            UserDefaults.standard.setValue(date, forKey: "today")
            UserDefaults.standard.setValue(0, forKey: "done")
            
        }else if UserDefaults.standard.object(forKey: "today") as! String == date && UserDefaults.standard.object(forKey: "done") as! Int == 0 {
            //今日は既に送信済み
            db.collection("Users").document(Auth.auth().currentUser!.uid).collection(String(collectionID)).document(String(documentID)).updateData(["weight":weight])
            
            UserDefaults.standard.setValue(date, forKey: "today")
        }else{
            
            db.collection("Users").document(Auth.auth().currentUser!.uid).collection(String(collectionID)).document(String(documentID)).setData(
            
                ["userName":userName,"userID":Auth.auth().currentUser!.uid,"weight":weight,"date":Date().timeIntervalSince1970]
            )
            UserDefaults.standard.setValue(date, forKey: "today")
            UserDefaults.standard.setValue(0, forKey: "done")
            
        }
        
        //data
    }
    
    
    
    func sendResultWeightToDB(userName:String,weight:String){
        
        //現在時刻を取得
        
        var date = GetDateModel.getTodayDate(slash:true)
    
        //年月→collectionIDとして
        for i in 0...1{
            
            if let slash = date.range(of: "/"){
                
                date.replaceSubrange(slash, with: "")
                print(date)
                
            }
            
        }
        let collectionID = date.prefix(6)
        let documentID = date.suffix(2)
        
    
        //日→ドキュメントIDとして
        
        //はじめてアプリを立ち上げたとき
        if UserDefaults.standard.object(forKey: "today2") != nil{
            
            
        }else{
            
            //はじめてのとき
            UserDefaults.standard.setValue(date, forKey: "today2")
            UserDefaults.standard.setValue(1, forKey: "done2")
            
        }
        
        //今日はまだ送信していない
        if UserDefaults.standard.object(forKey: "today2") as! String != date{
            
            db.collection("RankingData").document(Auth.auth().currentUser!.uid).setData(
            
                ["userName":userName,"userID":Auth.auth().currentUser!.uid,"resultWeight":weight]
            )
            UserDefaults.standard.setValue(date, forKey: "today2")
            UserDefaults.standard.setValue(0, forKey: "done2")
            
        }else if UserDefaults.standard.object(forKey: "today2") as! String == date && UserDefaults.standard.object(forKey: "done2") as! Int == 0 {
            //今日は既に送信済み
            db.collection("RankingData").document(Auth.auth().currentUser!.uid).updateData(
                ["userName":userName,"userID":Auth.auth().currentUser!.uid,"resultWeight":weight]

            )
            
            UserDefaults.standard.setValue(date, forKey: "today2")
        }else{
            
            db.collection("RankingData").document(Auth.auth().currentUser!.uid).setData(
            
                ["userName":userName,"userID":Auth.auth().currentUser!.uid,"resultWeight":weight]

            )
            UserDefaults.standard.setValue(date, forKey: "today2")
            UserDefaults.standard.setValue(0, forKey: "done2")
            
        }
    }
    
    

}
