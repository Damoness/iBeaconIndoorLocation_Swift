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

    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "配置设备"
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
