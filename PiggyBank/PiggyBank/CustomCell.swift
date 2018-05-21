//
//  CustomCell.swift
//  PiggyBank
//
//  Created by Angela Li on 5/20/18.
//  Copyright © 2018 Angela. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var Coin: UILabel!
    @IBOutlet weak var Amount: UILabel!
    @IBOutlet weak var Stepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    @IBAction func valueChanged(_ sender: UIStepper) {
        Amount.text = String(Int(Stepper.value))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "step"), object: nil)
    }
}
