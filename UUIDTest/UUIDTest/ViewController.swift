//
//  ViewController.swift
//  UUIDTest
//
//  Created by kou2k on 2017/04/26.
//  Copyright © 2017 kou2k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var advertisingIdentifierText: UILabel!
    @IBOutlet weak var identifierForVendorText: UILabel!
    

    var uuidManager: UUIDManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        uuidManager = UUIDManager()
        let ids = uuidManager.getUUID() as! [String:String]
        advertisingIdentifierText.text = ids["ifa"]
        identifierForVendorText.text = ids["ifv"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

