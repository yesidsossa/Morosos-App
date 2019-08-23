//
//  ViewController.swift
//  MorososApp
//
//  Created by Alejandro Alzate Zapata on 8/20/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//
import Firebase
import UIKit

class ViewController: UIViewController {

    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref.child("deudor").observe(.childAdded, with: { (snapshot) -> Void in
            
            var newItems = [String]() //Error: Use of unresolved identifier 'FDataSnapshot'
            
            for item in snapshot.children {
                newItems.append(item as! String)
            }
            
        })
    }
    
}

