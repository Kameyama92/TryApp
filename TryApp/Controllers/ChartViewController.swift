//
//  ChartViewController.swift
//  TryApp
//  Created by 亀山真矢 on 2021/02/26.
//

import UIKit
import Charts
import FirebaseAuth

class ChartViewController: UIViewController,ChartViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,GetDataProtocol {
    

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tap: UIButton!
    
    var chartArray = [PersonalData]()
    var sendModel = SendModel()
    var loadModel = LoadModel()
    
    let years = (2021...2031).map{ $0 }
    let month = (1...12).map{ $0 }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap.layer.cornerRadius = 15


        pickerView.delegate = self
        pickerView.dataSource = self
        chartView.backgroundColor = .white
        chartView.alpha = 0.9
        loadModel.getDataProtocol = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //現在時刻で年月を取得後、その月のデータを全部取得する
        let date = GetDateModel.getTodayDate(slash: true)
        let dateArray = date.components(separatedBy: "/")
        
            
        loadModel.loadMyRecordData(userID: Auth.auth().currentUser!.uid, yearMonth: dateArray[0] + dateArray[1], day: dateArray[2])
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0{
            
            return years.count
            
        }else if component == 1{
            return month.count
        }else{
            return 0
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            return "\(years[row])年"
        }else if component == 1{
            return "\(month[row])月"
        }else{
            return nil
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let year = years[pickerView.selectedRow(inComponent: 0)]
        let tuki = month[pickerView.selectedRow(inComponent: 1)]
        
        var tuki2 = String()
        if tuki < 10{
            tuki2 = "0" + String(tuki)
            label.text = "\(year)年\(tuki2)月"
        
            loadModel.loadMyRecordData(userID: Auth.auth().currentUser!.uid, yearMonth: String(year) + tuki2, day: "")
        }else{
            
            label.text = "\(year)年\(tuki)月"
            loadModel.loadMyRecordData(userID: Auth.auth().currentUser!.uid, yearMonth: String(year) + String(tuki), day: "")

        }
        
        pickerView.isHidden = true
        
    }
    
    func getData(dataArray: [PersonalData]) {
     
        chartArray = dataArray
        //チャートへの反映
        
        setUpChart(values: chartArray)
        //自分の差分
        if chartArray.count > 0{
        
            resultLabel.text = String(Double(chartArray.last!.weight)! - Double(chartArray.first!.weight)!)
            //追加
            chartView.xAxis.labelPosition = .bottom
            chartView.xAxis.labelCount = chartArray.count

            //            sendModel.sendTodayWeightToDB(userName: GetUserDataModel.getUserData(key: "userName"), weight: resultLabel.text!)
            sendModel.sendResultWeightToDB(userName: GetUserDataModel.getUserData(key: "userName"), weight: resultLabel.text!)
            
            
        }
        
    }
    
    
    func setUpChart(values:[PersonalData]){
        let formatter: DateFormatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = .short

        //値をチャートへ反映するメソッド
        var entry = [ChartDataEntry]()
        
        for i in 0..<values.count{
        
            let date = Date(timeIntervalSince1970: values[i].date)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ja_JP")
            dateFormatter.dateFormat = "dd"
            let dateString = dateFormatter.string(from: date)
            entry.append(ChartDataEntry(x:Double(dateString)!, y: Double(values[i].weight)!))

        }
        
        let dataSet = LineChartDataSet(entries: entry, label: "自分の体重")
        chartView.data = LineChartData(dataSet: dataSet)
        
    }
    
    
    //チャートの設定
    func setUpLineChart(_ chart:LineChartView,data:LineChartData){
 
        chart.delegate = self
        chart.chartDescription?.enabled = true
        chart.dragEnabled = true
        chart.setScaleEnabled(true)
        chart.setViewPortOffsets(left: 30, top: 0, right: 0, bottom: 30)
        chart.legend.enabled = true
        
        chart.leftAxis.enabled = true
        chart.leftAxis.spaceTop = 0.4
        chart.leftAxis.spaceBottom = 0.4
        
        
        chart.rightAxis.enabled = false
        chart.xAxis.enabled = true
        chart.data = data
        chart.animate(xAxisDuration: 2)
        
    }
    
    
    @IBAction func toRankVC(_ sender: Any) {
        
        let rankVC = self.storyboard?.instantiateViewController(identifier: "rankVC") as! RankingViewController
        self.navigationController?.pushViewController(rankVC, animated: true)
        
        
    }
    
    @IBAction func tap(_ sender: Any) {
        
        pickerView.isHidden = false
        
    }
    


}
