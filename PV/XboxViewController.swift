//
//  XboxViewController.swift
//  PV
//
//  Created by Red Phoenix on 24/11/20.
//

import UIKit
import AVKit
import AVFoundation

class XboxViewController: UIViewController {

    @IBOutlet weak var NextView: UIButton!
    
    @IBOutlet weak var xboxImage: UIImageView!
    
    @IBOutlet weak var xLogo: UIImageView!
    @IBOutlet weak var gradView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "intro", ofType: "mp4")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        
        
        player.play()
        
        view.bringSubviewToFront(gradView)
        view.bringSubviewToFront(NextView)
        view.bringSubviewToFront(xboxImage)
       
        
        
//        NextView.backgroundColor = .white
//        NextView.layer.cornerRadius = 5
//        NextView.layer.borderWidth = 1.5
//        NextView.layer.borderColor = UIColor.white.cgColor
        
        
    }

}
