//
//  OneBRSuiteController.swift
//  PBR_Directory
//
//  Created by Owner on 4/14/15.
//  Copyright (c) 2015 AlexWatts. All rights reserved.
//

import UIKit
import Foundation

class OneBRSuiteControllerController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func makeReservation(sender: AnyObject) {
        
        if let url = NSURL (string: "https://gc.synxis.com/rez.aspx?Hotel=15222&Chain=6522")
        {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}