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
    static var foundedArr:NSMutableArray!
    
    //// The static array containing all url schma of NOT INSTALLED application
    static var notFoundedArr:NSMutableArray!
    
    //// verify the list of url schema and arrange them into two sub-categories: INSTALLED AND NOT INSTALL application
    //// bundleInfos  - the input array consists of all unverified url schema of applications. This argument must not be nil
    //// Returns a string of result
    
    static func detectRelatedApplicationWithURLSchema(bundleInfos:NSArray!) -> String {
        var url:NSURL!
        foundedArr = NSMutableArray()
        notFoundedArr = NSMutableArray()
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
        let message = NSString(format: "Installed app: %@\rNot installed ap:%@", CheckAppExistence.foundedArr,CheckAppExistence.notFoundedArr)
        return message as String
    }
}
