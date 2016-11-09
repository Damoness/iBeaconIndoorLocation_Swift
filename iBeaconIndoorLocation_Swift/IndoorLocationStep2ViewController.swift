//
//  IndoorLocationStep2ViewController.swift
//  iBeaconIndoorLocation_Swift
//
//  Created by 吴狄 on 2016/11/8.
//  Copyright © 2016年 ditiy. All rights reserved.
//

import UIKit

class IndoorLocationStep2ViewController: BaseViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Step2"
        
        
        
        
        buttonOne.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonTwo.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonThree.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        buttonFour.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        
    }
    
    
    func buttonAction(_ sender: UIButton){
        
        
        self.navigationController?.pushViewController(DeployDeviceViewController(), animated: true)
        
        
        
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
