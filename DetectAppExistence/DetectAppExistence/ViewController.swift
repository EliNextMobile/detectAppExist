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
        let message = NSString(format: "Installed app: %@\rNot installed ap:%@", CheckAppExistence.foundedArr,CheckAppExistence.notFoundedArr)
        let alert = UIAlertController(title: "Notice", message: message as String, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

