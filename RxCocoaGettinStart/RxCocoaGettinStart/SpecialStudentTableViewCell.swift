//
//  SpecialStudentTableViewCell.swift
//  RxCocoaGettinStart
//
//  Created by Felipe Petersen on 02/04/20.
//  Copyright © 2020 Felipe Petersen. All rights reserved.
//

import UIKit

class SpecialStudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(name: String?) {
        self.nameLabel.text = name
    }
    
}
