//
//  ViewController.swift
//  Cronometro
//
//  Created by iXavy on 29/5/16.
//  Copyright © 2016 iXavy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var count:Int = 0
    
    var runing:Bool = false
    
    @IBOutlet weak var time: UILabel!
    
    @IBAction func stop(sender: AnyObject) {
        runing = false
        timer.invalidate()
        count = 0
        time.text = "\(count)"
    }
    
    @IBAction func play(sender: AnyObject) {
        if runing {
            runing = false
            timer.invalidate()
        } else {
            runing = true
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.autoTime), userInfo: nil, repeats: true)
        }
    }
    
    func autoTime() {
        
        count += 1
        
        time.text = "\(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
               // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

