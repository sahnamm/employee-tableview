//
//  EmployeeTableViewCell.swift
//  employee
//
//  Created by Sahna Melly Marselina on 01/03/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var accoupationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
