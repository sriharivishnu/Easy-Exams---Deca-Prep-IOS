//
//  ViewController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-09-28.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startExam(_ sender: Any) {
        //Start Exam
        let mainTabController = storyboard?.instantiateViewController(withIdentifier:"mainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[1]
        present(mainTabController, animated: true, completion: nil)
        
        
    }
    
}

