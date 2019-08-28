//
//  PaymentsTableViewController.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//
import Firebase
import UIKit
import Lottie

class PaymentsTableViewController: UITableViewController {

    var databaseReference: DatabaseReference!
    var listItems = [Payment] ()
    let animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = Animation.named("collecting_money")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false

        getList()
    }
    
    @objc func getList()  {
        listItems.removeAll()
        databaseReference = Database.database().reference()
        databaseReference.child("payments").observe(.childAdded, with: { (snapshot) -> Void in
            let response = snapshot.value as? NSDictionary
            let name = response?["name"] as? String ?? ""
            let value = response?["value"] as? String ?? ""
            
            if(value != "0"){
                self.listItems.append(Payment(name: name, value: value))
            }
            self.tableView.estimatedRowHeight = 44
            self.tableView.rowHeight = UITableView.automaticDimension
            //self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        })
        
    }
  
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 210
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerVew = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 200))
        
        animationView.heightAnchor.constraint(equalToConstant: headerVew.frame.height).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: headerVew.frame.width).isActive = true
        animationView.loopMode = LottieLoopMode.repeat(15)
        headerVew.addSubview(animationView)
        animationView.play()
        
        return headerVew
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "paymentCell")
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "paymentCell")
        }
        cell?.textLabel?.text = listItems[indexPath.row].name
        cell?.detailTextLabel?.text = listItems[indexPath.row].value
        cell?.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        return cell!
    }


}
