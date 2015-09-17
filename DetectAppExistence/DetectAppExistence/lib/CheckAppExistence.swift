//
//  CheckAppExistence.swift
//  DetectApplication
//
//  Created by Quan Quach on 9/17/15.
//  Copyright (c) 2015 Quan Quach. All rights reserved.
//

import UIKit

class CheckAppExistence: NSObject {
    
    //// The static array containing all url schema of INSTALLED application
    static var foundedArr = NSMutableArray()
    
    //// The static array containing all url schma of NOT INSTALLED application
    static var notFoundedArr = NSMutableArray()
    
    //// verify the list of url schema and arrange them into two sub-categories: INSTALLED AND NOT INSTALL application
    //// bundleInfos  - the input array consists of all unverified url schema of applications. This argument must not be nil
    //// Returns nothing
    
    static func detectRelatedApplicationWithURLSchema(bundleInfos:NSMutableArray!) {
        var url:NSURL!
        
        for (var i = 0;i < bundleInfos.count;++i) {
            let bundleInfo = bundleInfos.objectAtIndex(i) as! String
            url = NSURL(string: String(format: "%@://", bundleInfo))
            
            if (UIApplication.sharedApplication().canOpenURL(url)) {
                foundedArr.addObject(bundleInfo)
            }
            else {
                notFoundedArr.addObject(bundleInfo)
            }
        }
    }
}
