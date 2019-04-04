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
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       timeLabel.text = String("\(count2):\(count1):\(count)")
    }


    @IBAction func btnplay(_ sender: Any) {
        if speed == true{
        myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        print(count)
        speed = false
    }
    
    @IBAction func btnpause(_ sender: Any) {
        myTimer.invalidate()
        speed = true
    }
    
    
    @IBAction func btnstop(_ sender: Any) {
        myTimer.invalidate()
        speed = true
        count = 0
        count1 = 0
        count2 = 0
        myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    @objc func updateTime(){
        if count == 60 {
            count1 += 1
            count = 0
        }
        else if count1 == 60{
            count2 += 1
            count1 = 0
        }
        timeLabel.text = String("\(count2):\(count1):\(count)")
        count += 1
    }
}

