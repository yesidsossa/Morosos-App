//
//  RuleTableViewCell.swift
//  MorososApp
//
//  Created by Carlos Mario Rua Vargas on 8/30/19.
//  Copyright © 2019 Morosos App. All rights reserved.
//

import UIKit

class RuleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setData(rule : Rule){
        labelName.text = rule.rule
        labelValue.text = String(rule.value)
        iconImageView.image = UIImage(named: rule.getPovertyImageName())
    }
}
