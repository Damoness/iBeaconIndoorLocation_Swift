//
//  Item.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by wd on 2016/9/27.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit
import CoreLocation
class Item: NSObject {
    
    
    let name:String
    
    let uuid:NSUUID
    
    let majorValue:CLBeaconMajorValue

    let minorValue:CLBeaconMinorValue
    
    
    init(name:String,uuid:NSUUID,majorValue:CLBeaconMajorValue,minorValue:CLBeaconMinorValue) {

        self.name = name
        self.uuid = uuid
        self.majorValue = majorValue
        self.minorValue = minorValue
    }

}
