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
    
    //// 
    static var successDownloadArr: NSMutableArray!
    static var notSuccessDownloadArr: NSMutableArray!
    
    //// verify the list of url schema and arrange them into two sub-categories: INSTALLED AND NOT INSTALL application
    //// bundleInfos  - the input array consists of all unverified url schema of applications. This argument must not be nil
    //// Returns a string of result
    
    static func detectRelatedApplicationWithURLSchema(bundleInfos:NSMutableArray!) -> String {
        var url:NSURL!
        foundedArr = NSMutableArray()
        notFoundedArr = NSMutableArray()
        successDownloadArr = NSMutableArray()
        notSuccessDownloadArr = NSMutableArray()
        
        for (var i = 0;i < bundleInfos.count;++i) {
            let bundleInfo = bundleInfos.objectAtIndex(i) as! NSDictionary
            let schema = String(format: "%@://", bundleInfo.objectForKey("appScheme") as! String)
            url = NSURL(string: schema)
            
            if (UIApplication.sharedApplication().canOpenURL(url)) {
                foundedArr.addObject(bundleInfo.objectForKey("appScheme") as! String)
            }
            else {
                notFoundedArr.addObject(bundleInfo.objectForKey("appScheme") as! String)
                if ((bundleInfo.objectForKey("image")) == nil) {
                    let data = NSData(contentsOfURL: NSURL(string: bundleInfo.objectForKey("imageURL") as! String)!)
                    if (data != nil) {
                        let dict = NSMutableDictionary(dictionary: bundleInfo)
                        let image = UIImage(data: data!)
                        if (image != nil) {
                            dict.setObject(data!, forKey: "image")
                            bundleInfos.replaceObjectAtIndex(i, withObject: dict)
                            successDownloadArr.addObject(dict.objectForKey("appScheme") as! String)
                        }
                        else {
                            notSuccessDownloadArr.addObject(bundleInfo.objectForKey("appScheme") as! String)
                        }
                    }
                    else {
                        notSuccessDownloadArr.addObject(bundleInfo.objectForKey("appScheme") as! String)
                    }
                }
            }
        }
        let message = NSString(format: "Installed app: %@\rNot installed ap:%@\rSuccessfully download:%@\rNot successfully download:%@", self.foundedArr,self.notFoundedArr,self.successDownloadArr,self.notSuccessDownloadArr)
        return message as String
    }
}
