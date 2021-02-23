//
//  ViewController.swift
//  Swift6BMIApp1
//
//  Created by Yuta Fujii on 2021/02/01.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func done(_ sender: Any) {
    
        if textField.text?.isEmpty != true && heightField.text?.isEmpty != true {
            
            Auth.auth().signInAnonymously { (result, error) in
                
                if error != nil{
                    
                    print(error.debugDescription)
                    
                }else{
                    
                    UserDefaults.standard.setValue(self.textField.text, forKey: "userName")
                    UserDefaults.standard.setValue(self.heightField.text, forKey: "height")
                    print("自分")
                    print(Auth.auth().currentUser?.uid)

                    //画面遷移
                    let tabVC = self.storyboard?.instantiateViewController(identifier: "tabVC") as! TabViewController
                    
                    self.navigationController?.pushViewController(tabVC, animated: true)
                    
                    
                }
                
            }
            
        }
    
    }
    
}

