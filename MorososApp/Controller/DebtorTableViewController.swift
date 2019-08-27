//
//  DebtorTableViewController.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/26/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//
import Firebase
import UIKit

class DebtorTableViewController: UITableViewController {

    var databaseReference: DatabaseReference!
    var listItems = [Debtor] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        load()
        getList()
    }
    
    func load()  {
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(DebtorTableViewController.getList), for: UIControl.Event.valueChanged)
        let titulorefres = "Desliza para actualizar...";
        refreshControl?.attributedTitle = NSAttributedString(string: titulorefres)
    }

    @objc func getList()  {
        listItems.removeAll()
        databaseReference = Database.database().reference()
        databaseReference.child("deudor").observe(.childAdded, with: { (snapshot) -> Void in
            let response = snapshot.value as? NSDictionary
            let name = response?["name"] as? String ?? ""
            let value = response?["value"] as? String ?? ""
            let background = response?["background"] as? String ?? ""
            let icon = response?["icon"] as? String ?? ""
            
            if(value != "0"){
                self.listItems.append(Debtor(name: name, value: value, background: background, icon: icon))
            }
            self.tableView.estimatedRowHeight = 150.0
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celID = "DebtorCellId"
        let cell = tableView.dequeueReusableCell(withIdentifier: celID, for: indexPath) as! DebtorTableViewCell
        cell.setData(debtor: listItems[indexPath.row])
    
        return cell
    }

}
