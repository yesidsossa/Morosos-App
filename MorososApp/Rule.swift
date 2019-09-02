//
//  Rule.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class Rule: NSObject {
    var rule : String!
    var value : String!
    
    init(rule : String, value : String) {
        self.rule = rule
        self.value = value
    }
    
    public func getPovertyImageName() -> String {
        
        if let cost = Int(value.replacingOccurrences(of: ".", with: ""))
        {
            switch cost {
            case 0 ... 2000:
                return "povertyLevel1"
            case 2001 ... 4000:
                return "povertyLevel2"
            case 4001 ... 6000:
                return "povertyLevel3"
            default:
                return "povertyUndefined"
            }
        }
        else
        {
            return "povertyUndefined"
        }
    }
}
