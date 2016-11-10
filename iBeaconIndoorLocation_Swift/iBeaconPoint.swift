//
//  iBeaconPoint.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by 吴狄 on 2016/11/10.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit

class iBeaconPoint: NSObject {

    
    let x:Double //x坐标
    let y:Double //y坐标
    var distance:Double //距离
    
    init(x:Double,y:Double) {
        
        self.x = x
        self.y = y
        self.distance = 0
        
    }
    
    override var description: String{
        
        return "x:\(x),y:\(y),distance:\(distance)"
    }
    
    //func  addCircle(point:CGPoint,radius:CGFloat) -> CAShapeLayer
    
    //根据 3点坐标和距离未知点的距离 计算出 未知点的坐标
    static func calculatePoint(iBeaconPointX:iBeaconPoint,iBeaconPointY:iBeaconPoint,iBeaconPointZ:iBeaconPoint) -> CGPoint{
        
        var point = CGPoint()
        
        let x1 = Double(iBeaconPointX.x )
        let y1 = Double(iBeaconPointX.y )
        let x  = Double(iBeaconPointX.distance)
        let x2 = Double(iBeaconPointY.x )
        let y2 = Double(iBeaconPointY.y )
        let y  = Double(iBeaconPointY.distance)
        let x3 = Double(iBeaconPointZ.x )
        let y3 = Double(iBeaconPointZ.y )
        let z  = Double(iBeaconPointZ.distance)
        
        
        var a = (x2 - x3) * (y * y - x * x + x1 * x1 - x2 * x2 + y1 * y1 - y2 * y2 )
        var b = (x2 - x1)*(z * z - y * y + x2 * x2 - x3 * x3 + y2 * y2 - y3 * y3)
        var c =  2*((x1 - x2) * (y3 - y2) - (x2 - x3) * (y2-y1))
        
        point.y = CGFloat((a + b) / c)
        
        a = (y2 - y3)*(y * y - x * x + x1 * x1 - x2 * x2 + y1 * y1 - y2 * y2)
        b = (y2 - y1)*(z * z - y * y + x2 * x2 - x3 * x3 + y2 * y2 - y3 * y3)
        c =  2*((x3 - x2) * (y1 - y2) - (y2 - y3) * (x2-x1))
        
        point.x = CGFloat((a + b) / c)
        
        print("point \(point)")
    
        print("\n")
        
        return point
        
    }
    
    
}
