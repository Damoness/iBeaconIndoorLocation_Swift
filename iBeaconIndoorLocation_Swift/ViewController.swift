//
//  ViewController.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by wd on 2016/9/27.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var aView: UIView!
    
    let CLBeaconMajor1 = 10001;
    let CLBeaconMajor2 = 10002;
    let CLBeaconMajor3 = 10019;
    
    let locationManager = CLLocationManager()
    
    var point:CGPoint  = CGPoint(x: 100, y: 100)
    
    var shapeLayer = CAShapeLayer()
    
    
    var point1  = CGPoint(x: 400, y: 10)
    var point2  = CGPoint(x: 10, y: 10)
    var point3  = CGPoint(x: 10, y: 110)
    
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.locationManager.delegate = self
        
        let beaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!, identifier: "identifier1");
        
        self.addCircle(point: point1,radius: 3)
        self.addCircle(point: point2,radius:3)
        self.addCircle(point: point3,radius:3)
        
        
        self.locationManager.startMonitoring(for: beaconRegion)
        self.locationManager.startRangingBeacons(in: beaconRegion)
        
        
    }
    
    //增加一个圆点到View
    func  addCircle(point:CGPoint,radius:CGFloat) -> CAShapeLayer{
        
        
        let  bezierPath = UIBezierPath(roundedRect:CGRect(x: point.x - radius, y: point.y  - radius , width: radius * 2, height: radius * 2) , cornerRadius: radius)
        
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = bezierPath.cgPath;
        
        self.view.layer.addSublayer(shapeLayer)
        
        
        return shapeLayer
        
    }
    
    
    //func  beac
    
    func beaconRegionWithItem(item:Item) -> CLBeaconRegion{
        
        
        let beaconRegion = CLBeaconRegion(proximityUUID:item.uuid as UUID,
                                          major: item.majorValue,
                                          minor: item.minorValue,
                                          identifier: item.name)
        
        return beaconRegion
        
        
    }
    
    
    func startMonitoringItem(item:Item){
        let beaconRegion = beaconRegionWithItem(item: item);
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// MARK: - CLLocationManagerDelegate

extension ViewController:CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        //print(beacons);
        

        for beacon in beacons {
            
            print(beacon)
            
            if beacon.major.intValue ==  CLBeaconMajor1{
                
                self.x =  beacon.accuracy * 100
            
            }else if beacon.major.intValue == CLBeaconMajor2{
                
                self.y =  beacon.accuracy * 100
                
            }else if beacon.major.intValue == CLBeaconMajor3{
                
                self.z =  beacon.accuracy * 100
            }
        }
        
        print("x:\(self.x) y: \(self.y) + z: \(self.z)");
        
        
        let x1 = Double(point1.x)
        let y1 = Double(point1.y)
        let x2 = Double(point2.x)
        let y2 = Double(point2.y)
        let x3 = Double(point3.x)
        let y3 = Double(point3.y)
        
       var a = (x2 - x3) * (y * y - x * x + x1 * x1 - x2 * x2 + y1 * y1 - y2 * y2 )
       var b = (x2 - x1)*(z * z - y * y + x2 * x2 - x3 * x3 + y2 * y2 - y3 * y3)
       var c =  2*((x1 - x2) * (y3 - y2) - (x2 - x3) * (y2-y1))
        
        self.point.y = CGFloat((a + b) / c)
        
        
        a = (y2 - y3)*(y * y - x * x + x1 * x1 - x2 * x2 + y1 * y1 - y2 * y2)
        b = (y2 - y1)*(z * z - y * y + x2 * x2 - x3 * x3 + y2 * y2 - y3 * y3)
        c =  2*((x3 - x2) * (y1 - y2) - (y2 - y3) * (x2-x1))
        
        self.point.x = CGFloat((a + b) / c)
        
        print("point \(point)")
        
        shapeLayer.removeFromSuperlayer()
        
        shapeLayer =  self.addCircle(point: self.point,radius:3)
        
        print("\n")
        

        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Location manager failed:\(error.localizedDescription)")
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        
        print("Failed monitoring region:\(error.localizedDescription)")
    }
    
    
}
