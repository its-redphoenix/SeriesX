//
//  ThreeViewController.swift
//  PV
//
//  Created by Red Phoenix on 24/11/20.
//

import UIKit
import AVKit
import AVFoundation

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "speed", ofType: "mov")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        
        
        player.play()
        
     
       
        
        
//        NextView.backgroundColor = .white
//        NextView.layer.cornerRadius = 5
//        NextView.layer.borderWidth = 1.5
//        NextView.layer.borderColor = UIColor.white.cgColor
        
        
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
