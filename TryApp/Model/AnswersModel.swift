//
//  AnswersModel.swift
//  Swift6FireStore1
//
//  Created by Yuta Fujii on 2020/09/06.
//

import Foundation

struct AnswersModel {
    
    let answers:String
    let userName:String
    let docID:String
    let likeCount:Int
    let likeFlagDic:Dictionary<String, Any>
}
