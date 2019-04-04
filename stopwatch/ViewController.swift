//
//  ViewController.swift
//  stopwatch
//
//  Created by D7703_19 on 2019. 4. 2..
//  Copyright © 2019년 sin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @objc var count = 0
    var count1 = 0
    var count2 = 0
    var myTimer = Timer()
    var speed = true
    @IBOutlet weak var buttonplay: UIBarButtonItem!
  
    @IBOutlet weak var buttonpause: UIBarButtonItem!
    
    @IBOutlet weak var buttonstop: UIBarButtonItem!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       timeLabel.text = String("00:00:00")
    }


    @IBAction func btnplay(_ sender: Any) {
        if speed == true{
        myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        buttonplay.isEnabled = false
        
        print(count)
        speed = false
    }
    
    @IBAction func btnpause(_ sender: Any) {
        myTimer.invalidate()
        speed = true
        buttonpause.isEnabled = false
        buttonplay.isEnabled = true
    }
    
    
    @IBAction func btnstop(_ sender: Any) {
        myTimer.invalidate()
        speed = true
        count = 0
        count1 = 0
        count2 = 0
        timeLabel.text = String(format: "%02d:%02d:%02d",count2,count1,count)
        buttonplay.isEnabled = true
        buttonpause.isEnabled = false
        buttonstop.isEnabled = false
    }
    @objc func updateTime(){
        if count == 100 {
            count1 += 1
            count = 0
        }
        else if count1 == 60{
            count2 += 1
            count1 = 0
        }
        timeLabel.text = String(format: "%02d:%02d:%02d",count2,count1,count)
       // timeLabel.text = String("\(count2):\(count1):\(count)")
        count += 1
    }
}

