//
//  ExamViewController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-10-04.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import Foundation
import UIKit

class ExamViewController : UIViewController {
    @IBOutlet weak var ExamScrollView: UIScrollView!
    @IBOutlet weak var homeButton: UIToolbar!
    var lines : Array<String> = Array()
    var answers : Array<String> = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func onHomeClicked(_ sender: Any) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
