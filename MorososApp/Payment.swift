//
//  Payment.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class Payment: NSObject {

    var name : String!
    var value : Int!
//    var icon : String!
    
    init(name : String, value : Int) {
        super.init()
        self.name = name
        self.value = value
//        self.icon = getPovertyImageName()
    }
    
//    public func getPovertyImageName() -> String {
//
//        let cost = Int(value)
//
//        switch cost {
//        case 0 ... 2000:
//            return "povertyLevel1"
//        case 2001 ... 4000:
//            return "povertyLevel2"
//        default:
//            return "povertyLevel3"
//        }
//    }
}
