//
//  StudentInfoTableViewCell.swift
//  SwiftMVVMProject
//
//  Created by SawPyaeHtun on 1/8/19.
//  Copyright © 2019 SawPyaeHtun. All rights reserved.
//

import UIKit

class StudentInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var student : Student?{
        didSet{
            cellDataSet()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellDataSet() {
        nameLabel.text = student?.name
        addressLabel.text = student?.address
    }
    
}
