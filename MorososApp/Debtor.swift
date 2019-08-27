//
//  Debtor.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/26/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class Debtor: NSObject {
    var name : String!
    var value : String!
    var background : String!
    var icon : String!
    
    init(name : String, value : String, background : String, icon : String) {
        self.name = name
        self.value = value
        self.background = background
        self.icon = icon
    }
}
