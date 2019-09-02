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
    
    init(name : String, value : Int) {
        super.init()
        self.name = name
        self.value = value
    }
}
