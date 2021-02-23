//
//  introViewController.swift
//  DiveApp
//
//  Created by 亀山真矢 on 2021/02/19.
//

import UIKit
import Lottie

class introViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboardArray = ["1","2","3","4","5"]
    
    var onboardStringArray = ["私たちはひとりではありません","どこにいても繋がっています","ひとりでは超えられない壁もきみとであれば","この瞬間から主役へ","さあ、未来は私たちで"]
    
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ページングができるようになる
        scrollView.isPagingEnabled = true
        setUpScroll()
        
        for i in 0...4{
            
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: -15, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
            
        }

    }
    
    //ナビゲーションバーを消し去る
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScroll(){
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        
        for i in 0...4{
            
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
            
        }
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
