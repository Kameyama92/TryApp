//
//  SettingViewController.swift
//  TryApp
//  Created by 亀山真矢 on 2021/02/26.
//

import UIKit

class SettingViewController: UIViewController {

    var alertSystem = AlertSystem()
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var done: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        done.layer.cornerRadius = 15

        
    }
    
    @IBAction func done(_ sender: Any) {
        
        if heightTextField.text?.isEmpty != true{
            
            UserDefaults.standard.setValue(self.heightTextField.text, forKey: "height")
            
        }

        if weightTextField.text?.isEmpty != true{
            
            UserDefaults.standard.setValue(self.weightTextField.text, forKey: "weight")
            
        }
        
        alertSystem.showAlert(title: "保存しました！", message: "", buttonTitle: "完了", viewController: self)
        

        
        
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
