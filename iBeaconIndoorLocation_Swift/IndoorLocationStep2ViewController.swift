//
//  IndoorLocationStep2ViewController.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by 吴狄 on 2016/11/8.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit
import CoreLocation

class IndoorLocationStep2ViewController: BaseViewController,DeployDeviceDelegate {

    
    
    static let kMargin:CGFloat = 15.0
    static let kCircleRadius:CGFloat = 8.0
    static let kIndoorLocationViewWidth = UIScreen.main.bounds.width - 2 * 20
    
    @IBOutlet weak var indoorLocationView: UIView!
    
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    
    var beaconMajor1:Int? = 10002
    var beaconMajor2:Int? = 10029
    var beaconMajor3:Int? = 10001
    var beaconMajor4:Int? = 10019
    
    var point1  = CGPoint(x: kMargin + kCircleRadius , y: kMargin + kCircleRadius)
    var point2  = CGPoint(x: (kIndoorLocationViewWidth - (kMargin + kCircleRadius)) , y: kMargin + kCircleRadius)
    var point3  = CGPoint(x: kMargin + kCircleRadius, y: (kIndoorLocationViewWidth - (kMargin + kCircleRadius)))
    var point4  = CGPoint(x: (kIndoorLocationViewWidth - (kMargin + kCircleRadius)), y: (kIndoorLocationViewWidth - (kMargin + kCircleRadius)))
    
    var  iBeaconPoint1:iBeaconPoint? 
    var  iBeaconPoint2:iBeaconPoint?
    var  iBeaconPoint3:iBeaconPoint?
    var  iBeaconPoint4:iBeaconPoint?
    
    
    var point:CGPoint  = CGPoint(x: 100, y: 100)
    
    var shapeLayer = CAShapeLayer()
    
//    var x:Double = 0.0
//    var y:Double = 0.0
//    var z:Double = 0.0
    
    let locationManager = CLLocationManager()
    
    //let deployDeviceDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Step2"
        
        
        
        self.iBeaconPoint1 = iBeaconPoint(x: Double(point1.x  / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 4), y: Double(point1.y  / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 6))
        self.iBeaconPoint2 = iBeaconPoint(x: Double(point2.x  / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 4), y: Double(point2.y  / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 6))
        self.iBeaconPoint3 = iBeaconPoint(x: Double(point3.x / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 4), y: Double(point3.y / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 6))
        self.iBeaconPoint4 = iBeaconPoint(x: Double(point4.x / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 4), y: Double(point4.y  / IndoorLocationStep2ViewController.kIndoorLocationViewWidth * 6))
        
        
        
        
        buttonOne.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonTwo.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonThree.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonFour.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        
        self.addCircle(point: point1,radius:IndoorLocationStep2ViewController.kCircleRadius)
        self.addCircle(point: point2,radius:IndoorLocationStep2ViewController.kCircleRadius)
        self.addCircle(point: point3,radius:IndoorLocationStep2ViewController.kCircleRadius)
        self.addCircle(point: point4,radius:IndoorLocationStep2ViewController.kCircleRadius)
        
        
        let beaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")!, identifier: "identifier1");
        
        self.locationManager.delegate = self
        self.locationManager.startMonitoring(for: beaconRegion)
        self.locationManager.startRangingBeacons(in: beaconRegion)
        
    }
    
    
    func buttonAction(_ sender: UIButton){
        
        
        let deployDeviceVC = DeployDeviceViewController()
        
        deployDeviceVC.delegate = self
        
        self.navigationController?.pushViewController(deployDeviceVC, animated: true)
        
        
        
    }
    
    
    //增加一个圆点到View
    func  addCircle(point:CGPoint,radius:CGFloat) -> CAShapeLayer{
        
        let  bezierPath = UIBezierPath(roundedRect:CGRect(x: point.x - radius, y: point.y  - radius , width: radius * 2, height: radius * 2) , cornerRadius: radius)
        
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = bezierPath.cgPath;
        
        self.indoorLocationView.layer.addSublayer(shapeLayer)
        
        return shapeLayer
        
    }
    
    
    
    
    
    func didBindDevice(beacon: CLBeacon) {
    
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension IndoorLocationStep2ViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        
        
        print(beacons)
        
        for beacon in beacons {
            
            
            print(beacon)
            
            if beacon.rssi == 0 {
                
                continue
            }
            
            if beacon.major.intValue ==  beaconMajor1{
                
                self.x =  beacon.accuracy
                self.iBeaconPoint1?.distance = beacon.accuracy
                
            }else if beacon.major.intValue == beaconMajor2{
                
                self.y =  beacon.accuracy
                self.iBeaconPoint2?.distance = beacon.accuracy
                
            }else if beacon.major.intValue == beaconMajor3{
                
                self.z =  beacon.accuracy
                self.iBeaconPoint3?.distance = beacon.accuracy
                
            }else if beacon.major.intValue == beaconMajor4{
                
                self.iBeaconPoint4?.distance = beacon.accuracy
            }
        }
    
        
        let iBeaconPointArray = [self.iBeaconPoint1,self.iBeaconPoint2,self.iBeaconPoint3,self.iBeaconPoint4]
        
        var sortediBeaconPointArray  =  iBeaconPointArray.sorted { (x, y) -> Bool in
            
            return (x?.distance)! > (y?.distance)!
            
        }
        
        sortediBeaconPointArray.remove(at: 0)
        
        
        print(sortediBeaconPointArray)
        
        
        var point = iBeaconPoint.calculatePoint(iBeaconPointX: sortediBeaconPointArray[0]!, iBeaconPointY: sortediBeaconPointArray[1]!, iBeaconPointZ: sortediBeaconPointArray[2]!)
        
        
        point.x =  point.x / 4 * IndoorLocationStep2ViewController.kIndoorLocationViewWidth
        point.y =  point.y / 6 * IndoorLocationStep2ViewController.kIndoorLocationViewWidth
        
        
        print("point \(point)")
        
        shapeLayer.removeFromSuperlayer()
        
        shapeLayer =  self.addCircle(point: point,radius:8)
        
        print("\n")
        
        
        
    }
    
    
    
    
    
}
