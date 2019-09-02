//
//  RulesTableViewController.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//
import Firebase
import UIKit

class RulesTableViewController: UITableViewController {

    var databaseReference: DatabaseReference!
    var listItems = [Rule] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        getList()
    }
    func load()  {
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(RulesTableViewController.getList), for: UIControl.Event.valueChanged)
        let titulorefres = "Desliza para actualizar...";
        refreshControl?.attributedTitle = NSAttributedString(string: titulorefres)
    }
    
    @objc func getList() {
        listItems.removeAll()
        databaseReference = Database.database().reference()
        databaseReference.child("rules").observe(.childAdded, with: { (snapshot) -> Void in
            let response = snapshot.value as? NSDictionary
            let name = response?["description"] as? String ?? ""
            let value = response?["value"] as? String ?? ""
            
            if(value != "0"){
                self.listItems.append(Rule(rule: name, value: value))
            }
            self.tableView.estimatedRowHeight = 44
            self.tableView.rowHeight = UITableView.automaticDimension
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        })
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "rulesCell") as! RuleTableViewCell
        cell.setData(rule: listItems[indexPath.row])
        return cell
    }

}
