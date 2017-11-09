//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Paul on 2017-11-08.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeCounter: UILabel!

    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeCounter.text = String(counter)
        pauseButton.isEnabled = false
        
    }

    @IBAction func start(_ sender: UIButton) {
        if (isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func reset(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.
        
        
    }
    

    
    
    @objc func updateTimer() {
   

    }
    
    func stopWatch() {
        indicator = false
    }
    
    func resetWatch() {
        counter = 0
        timeCounter.text = String(format: "%.1f", counter)
        
    }
    
 
    

}

