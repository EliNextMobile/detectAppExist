//
//  ViewController.swift
//  DetectAppExistence
//
//  Created by Quan Quach on 9/17/15.
//  Copyright (c) 2015 Quan Quach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func checkExistence(sender: AnyObject) {
        //specify the list of unverified url schema of application
        CheckAppExistence.detectRelatedApplicationWithURLSchema(["fb740441725988493","myapp1","myapp2","myapp3"])
        
        println("Installed application \(CheckAppExistence.foundedArr)")
        println("Not installed application \(CheckAppExistence.notFoundedArr)")
    }

}

