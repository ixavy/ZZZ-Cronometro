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
    
    var pauseButton = UIBarButtonItem()
    var playButton = UIBarButtonItem()
    var arrayOfButtons = [UIBarButtonItem]()
    
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var time: UILabel!
    
    @IBAction func stop(sender: AnyObject) {
        self.buttonPressed(playButton)
        runing = false
        timer.invalidate()
        count = 0
        time.text = "\(count)"
    }
    
    @IBAction func play(sender: AnyObject) {
        if runing {
            self.buttonPressed(playButton)
            runing = false
            timer.invalidate()
        } else {
            self.buttonPressed(pauseButton)
            runing = true
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.autoTime), userInfo: nil, repeats: true)
        }
    }
 
    func buttonPressed(buttonInsert:UIBarButtonItem) {
        arrayOfButtons.removeLast()
        arrayOfButtons.insert(buttonInsert, atIndex: arrayOfButtons.count )
        self.toolbar.setItems(arrayOfButtons, animated: false)
    }
    
    func autoTime() {
        count += 1
        time.text = "\(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: #selector(ViewController.play))
        
        playButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: #selector(ViewController.play))
        
        arrayOfButtons = self.toolbar.items!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

