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
    
    @IBOutlet weak var enterTimeTextField: UITextField!
    
    
    var counter = 0.00
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        timeCounter.text = String(counter)
        pauseButton.isEnabled = false
        
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        if (isPlaying) {
            return
        }
        
            guard let time = Double(enterTimeTextField.text!) else {
                print("Enter specified time")
                return
            }
            counter = time
            timeCounter.text = String(counter)
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            
            timer = Timer.scheduledTimer(timeInterval: -0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPlaying = true
            enterTimeTextField.text = ""

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
            
            timer.invalidate()
            isPlaying = false
            counter = 0.0
            timeCounter.text = String(counter)
            
        }
        
        @objc func updateTimer() {
            counter = counter - 0.01
            timeCounter.text = String(format: "%.2f", counter)
            
            if counter < 0 {
                timer.invalidate()
                isPlaying = false
                timeCounter.text = "Time's Up"
                startButton.isEnabled = true
            }
        }
        
        
        @IBAction func enterTimeTapped(_ sender: UIButton) {
            
            guard let customizedTime = enterTimeTextField.text else {
                print("Time can not be blank")
                return
            }
            timeCounter.text = customizedTime
        }
        
    }
    
    extension UIViewController {
        
        func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
        
}

