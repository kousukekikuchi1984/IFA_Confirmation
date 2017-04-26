//
//  UUIDManager.swift
//  UUIDTest
//
//  Created by kou2k on 2017/04/26.
//  Copyright © 2017 kou2k. All rights reserved.
//

import Foundation
import AdSupport
import UIKit

class UUIDManager {
    
    lazy var asiManager = {
        return ASIdentifierManager.shared
    }()
    
    lazy var uiDevice = {
        return UIDevice.current
    }()
    
    func getUUID() -> NSDictionary {
        var ifa: String!
        if asiManager().isAdvertisingTrackingEnabled {
            ifa = asiManager().advertisingIdentifier.uuidString
        } else {
            ifa = "ifa access is prohibited"
        }
        
        let ifv = uiDevice.identifierForVendor?.uuidString
        return [
            "ifa": ifa,
            "ifv": ifv!,
        ]
    }
}
