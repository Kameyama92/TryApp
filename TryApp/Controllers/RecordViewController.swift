//
//  RecordViewController.swift
//  TryApp
//  Created by 亀山真矢 on 2021/02/26.
//

import UIKit

class RecordViewController: UIViewController {

    var getDateModel = GetDateModel()
    var sendModel = SendModel()
    var alertSystem = AlertSystem()
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var betterWeightLabel: UILabel!
    @IBOutlet weak var recordWeight: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.layer.cornerRadius = 85
        recordWeight.layer.cornerRadius = 15
        
        //今日の日付
        dateLabel.text = GetDateModel.getTodayDate(slash: false)

        betterWeightLabel.text = "\(getDateModel.calcBetterWeight()) kg"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputTextField.resignFirstResponder()
    }
    
    @IBAction func recordWeight(_ sender: Any) {
   
        //DBの中にuserName,体重,日付などを入れる
        sendModel.sendTodayWeightToDB(userName: GetUserDataModel.getUserData(key: "userName"), weight: inputTextField.text!)
        //アラート(保存されました！)
        alertSystem.showAlert(title: "保存されました！", message: "", buttonTitle: "OK", viewController: self)
        
    }

}
