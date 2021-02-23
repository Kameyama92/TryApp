//
//  AlertSystem.swift
//  Swift6BMIApp1
//
//  Created by Yuta Fujii on 2021/02/01.
//

import Foundation
import EMAlertController

class AlertSystem {
    
    
    
    func showAlert(title:String,message:String,buttonTitle:String,viewController:UIViewController){
        
        let alert = EMAlertController(title: title, message: message)
        let close = EMAlertAction(title: buttonTitle, style: .cancel)
        alert.cornerRadius = 10.0
        alert.iconImage = UIImage(named: "ok")
        alert.addAction(close)
        viewController.present(alert, animated: true, completion: nil)
        
        
    }
    
}
