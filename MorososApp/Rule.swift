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
}
