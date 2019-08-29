//
//  PaymentTableViewCell.swift
//  MorososApp
//
//  Created by Yesid Steven Hernandez Sossa on 8/28/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setData(payment : Payment){
        labelName.text = payment.name
        labelValue.text = String(payment.value)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
