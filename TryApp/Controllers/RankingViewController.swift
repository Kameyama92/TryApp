//
//  RankingViewController.swift
//  Swift6BMIApp1
//
//  Created by Yuta Fujii on 2021/02/02.
//

import UIKit
import FirebaseAuth


class RankingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetRankProtocol {
    

    @IBOutlet weak var tableView: UITableView!
    var loadModel = LoadModel()
    var rankDataArray = [RankData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        //ランキングデータをロード
        loadModel.getRankProtocol = self
//        rankDataArray = []
        loadModel.loadRankingData(userID: Auth.auth().currentUser!.uid)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = .clear
        let rankLabel = cell.contentView.viewWithTag(1) as! UILabel
        rankLabel.text = String(indexPath.row + 1)
        
        let nameLabel = cell.contentView.viewWithTag(2) as! UILabel
        nameLabel.text = rankDataArray[indexPath.row].userName
        
        let weightLabel = cell.contentView.viewWithTag(3) as! UILabel
        weightLabel.text = rankDataArray[indexPath.row].resultWeight
        
        if rankDataArray[indexPath.row].userID == Auth.auth().currentUser?.uid{

            cell.contentView.backgroundColor = .systemTeal
            
        }
        
        
        return cell
        
    }
    

    
    func getRankData(dataArray: [RankData]) {
        print(dataArray.debugDescription)
        rankDataArray = dataArray
        tableView.reloadData()
        
    }
   
    


}
