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
        startWatch()
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetWatch()
    }
    

    
    
    func startWatch() {
        
        indicator = true
        repeat {
            if counter > 1000000000000000000 {
                indicator = false
            }
            counter = counter + 0.1
            timeCounter.text = String(format: "%.1f", counter)
        
        } while indicator == true

    }
    
    func stopWatch() {
        indicator = false
    }
    
    func resetWatch() {
        counter = 0
        timeCounter.text = String(format: "%.1f", counter)
        
    }
    
 
    

}

