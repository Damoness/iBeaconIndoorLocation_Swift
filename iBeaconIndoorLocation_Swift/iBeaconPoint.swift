//
//  iBeaconPoint.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by 吴狄 on 2016/11/10.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit

class iBeaconPoint: NSObject {

    
    let x:Double
    let y:Double
    let distance:Double
    
    init(x:Double,y:Double) {
        
        self.x = x
        self.y = y
        self.distance = 0
        
    }
    
}
