//
//  ChooseExamTableCell.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-10-02.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import Foundation
import UIKit

//Custom Choose Exam Table Cell class
class ChooseExamTableCell : UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var examLabelName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
