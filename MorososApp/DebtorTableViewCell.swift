//
//  DebtorTableViewCell.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/26/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class DebtorTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func hexStringToUIColor (_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    public func setData(debtor : Debtor){
        containerView.backgroundColor = hexStringToUIColor(debtor.background)
        containerView.layer.cornerRadius = 10
        
        labelName.text = debtor.name
        labelDescription.text = debtor.value
        let url = "https://firebasestorage.googleapis.com/v0/b/debtor-5f7c6.appspot.com/o/profile%2F" + debtor.icon + "?alt=media"
        
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.imgIcon.image = image
            })
            
        }).resume()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
