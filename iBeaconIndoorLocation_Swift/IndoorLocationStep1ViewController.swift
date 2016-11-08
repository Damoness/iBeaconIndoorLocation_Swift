//
//  IndoorLocationStep1ViewController.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by wd on 2016/10/27.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit

class IndoorLocationStep1ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.navigationItem.backBarButtonItem?.title = ""

        
    }
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        
        
        self.navigationController?.pushViewController(IndoorLocationStep2ViewController(), animated: true)
        
        
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
