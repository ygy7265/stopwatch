//
//  ViewController.swift
//  stopwatch
//
//  Created by D7703_19 on 2019. 4. 2..
//  Copyright © 2019년 sin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @objc var count = 1
    var count1 = 1
    var count2 = 1
    var myTimer = Timer()
    var speed = true
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabel1: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "0"
        timeLabel1.text = "0  :"
        timeLabel2.text = "0  :"
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
        myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    @objc func updateTime(){
        if count == 60 {
            timeLabel1.text = String("\(count1)  :")
            count1 += 1
            count = 0
        }
        else if count1 == 60{
            timeLabel2.text = String("\(count2)  :")
            count2 += 1
            count1 = 0
        }
        timeLabel.text = String(count)
        count += 1
    }
}

