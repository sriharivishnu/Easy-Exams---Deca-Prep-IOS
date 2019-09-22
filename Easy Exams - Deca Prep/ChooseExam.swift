//
//  ChooseExam.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-09-30.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import Foundation
import UIKit

class ChooseExam : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var chooseExamTableView: UITableView!
    
    private var exams = ["Marketing", "Finance", "Business Administration", "Hospitality and Tourism"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ChooseExamTableCell = tableView.dequeueReusableCell(withIdentifier: "ChooseExamTableCell", for: indexPath) as! ChooseExamTableCell
        cell.examLabelName?.text = exams[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    @IBOutlet weak var showChooseExams: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        chooseExamTableView.reloadData()
        
    }
    
}
