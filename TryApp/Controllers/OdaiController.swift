//
//  ViewController.swift
//  Swift6FireStore1
//
//  Created by Yuta Fujii on 2020/09/06.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import EMAlertController

class OdaiController: UIViewController {

    //DBの場所を指定
    let db1 = Firestore.firestore().collection("Odai").document("Nq2MjYpktYvA37b2TI6Z")
    
    let db2 = Firestore.firestore()
    
    var userName = String()
    
    @IBOutlet weak var odaiLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var kakunin: UIButton!
    
    var idString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kakunin.layer.cornerRadius = 15
        odaiLabel.layer.cornerRadius = 10
        textView.layer.cornerRadius = 10

        
        
        if UserDefaults.standard.object(forKey: "userName") != nil{
            
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if UserDefaults.standard.object(forKey: "documentID") != nil{
            
            idString = UserDefaults.standard.object(forKey: "documentID") as! String
            
        }else{
        
            idString = db2.collection("Answers").document().path
            print(idString)
            //Answers/iaisdakj20
            idString = String(idString.dropFirst(8))
            UserDefaults.standard.setValue(idString, forKey: "documentID")
        
        }
        
        self.navigationController?.isNavigationBarHidden = true
        loadQuestionData()
    }
    
    func loadQuestionData(){
        
        db1.getDocument { (snapShot, error) in
            
            if error != nil{
                return
            }
            
            let data = snapShot?.data()
            self.odaiLabel.text = data!["odaiText"] as! String
            
        }
        
    }

    
    @IBAction func send(_ sender: Any) {
        
        
        db2.collection("Answers").document(idString).setData(
            
            ["answer":textView.text as Any,"userName":userName as Any,"postDate":Date().timeIntervalSince1970,"like":0,"likeFlagDic":[idString:false]]
        
        )
        
        
        //アラート
        let alert = EMAlertController(icon: UIImage(named: "check"), title: "投稿完了！", message: "みんなの回答を見てみよう！")
        let doneAction = EMAlertAction(title: "OK", style: .normal)
        alert.addAction(doneAction)
        present(alert, animated: true, completion: nil)
        textView.text = ""


    }
    
    
    @IBAction func checkAnswer(_ sender: Any) {
        
        //画面遷移
        let checkVC = self.storyboard?.instantiateViewController(identifier: "checkVC") as! CheckViewController
        checkVC.odaiString = odaiLabel.text!
        self.navigationController?.pushViewController(checkVC, animated: true)
        
        
    }
    
    

    @IBAction func logout(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            UserDefaults.standard.removeObject(forKey: "userName")
            UserDefaults.standard.removeObject(forKey: "documentID")
        } catch let error as NSError {
            print("エラー",error)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    

}

