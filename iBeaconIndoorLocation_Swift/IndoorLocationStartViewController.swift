//
//  IndoorLocationStartViewController.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by wd on 2016/10/27.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit

class IndoorLocationStartViewController: BaseViewController {

    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.navigationItem.title = "室内定位"
        
        
        self.startButton.layer.cornerRadius = 50
        self.startButton.backgroundColor = UIColor.white
        self.startButton.layer.shadowColor = UIColor.black.cgColor
        self.startButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.startButton.layer.shadowRadius = 2
        self.startButton.layer.shadowOpacity = 0.5
        self.startButton.layer.opacity = 0.3
        
        
    }
    
    
    @IBAction func startAction(_ sender: UIButton) {
        
        
        let step1VC = IndoorLocationStep1ViewController()
        
        self.navigationController?.pushViewController(step1VC, animated: true)
        
        
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
