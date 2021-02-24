//
//  MovieViewController.swift
//  TryApp
//
//  Created by 亀山真矢 on 2021/02/24.
//

import UIKit
import AVFoundation

class MovieViewController: UIViewController {
    
    var player = AVPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let path = Bundle.main.path(forResource: "sea", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player.play()
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        
        //無限ループ
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (notification) in
            
            self.player.seek(to: .zero)
            self.player.play()
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
