//
//  DeployDeviceViewController.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by 吴狄 on 2016/11/8.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit
import CoreLocation

class DeployDeviceViewController: UIViewController {

    
    @IBOutlet weak var showLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var selectedBeacon:CLBeacon? //选中的Beacon设备
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "配置设备"
        
        self.locationManager.delegate = self
        
        
        
        let uuid = UUID(uuidString: "FDA50693-A4E2-4FB1-AFCF-C6EB07647825")

        
        let regionBeacon = CLBeaconRegion(proximityUUID: uuid!, identifier: "identifier")
        
    
        self.locationManager.startMonitoring(for: regionBeacon)
        self.locationManager.startRangingBeacons(in: regionBeacon)
        
        
    }
    
    
    
    @IBAction func bindDeviceAction(_ sender: UIButton) {
        
        
        
        
        
        
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


extension DeployDeviceViewController:CLLocationManagerDelegate{
    

    
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        
        print(beacons)
        print("\n")
        
        for beacon in beacons {
            
            if beacon.accuracy < 1 && beacon.rssi != 0{
                
                self.selectedBeacon = beacon
                self.showLabel.text = "\(beacon.major)"
            }
            
        }
    }
    
    
    
}
