//
//  ViewController.swift
//  AnimationExample
//
//  Created by Priya Talreja on 08/04/18.
//  Copyright © 2018 Priya Talreja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    var animationView:Animation = Animation()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = Animation(frame: self.view.bounds)
        animationView.birthRate = 2.0
        animationView.imageName = "heart"
        self.view.addSubview(animationView)
        self.animationView.addSubview(startButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    

    @IBAction func startAnimationClicked(_ sender: UIButton) {
        self.animationView.startAnimation();
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(stop), userInfo: nil, repeats: false)
    }
    
    @objc func stop()
    {
        self.animationView.stopAnimation();
    }
}

