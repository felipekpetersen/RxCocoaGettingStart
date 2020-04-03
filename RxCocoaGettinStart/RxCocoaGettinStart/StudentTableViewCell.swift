//
//  StudentTableViewCell.swift
//  RxCocoaGettinStart
//
//  Created by Felipe Petersen on 02/04/20.
//  Copyright © 2020 Felipe Petersen. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tiaLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(student: Student) {
        self.nameLabel.text = student.name
        self.tiaLabel.text = student.tia
        self.ageLabel.text = student.age
    }
    
}
