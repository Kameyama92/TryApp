//
//  RecordViewController.swift
//  Swift6BMIApp1
//
//  Created by Yuta Fujii on 2021/02/01.
//

import UIKit

class RecordViewController: UIViewController {

    var getDateModel = GetDateModel()
    var sendModel = SendModel()
    var alertSystem = AlertSystem()
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var betterWeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //今日の日付
        dateLabel.text = GetDateModel.getTodayDate(slash: false)

        betterWeightLabel.text = "\(getDateModel.calcBetterWeight()) kg"
        
        // Do any additional setup after loading the view.
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
