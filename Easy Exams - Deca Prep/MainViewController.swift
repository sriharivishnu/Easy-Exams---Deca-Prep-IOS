//
//  ViewController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-09-28.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var my_textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        my_textview.text = "HERE2"
        if let path = Bundle.main.path(forResource: "MarketingExamQuestions", ofType: "txt")
        {
            let fm = FileManager()
            let exists = fm.fileExists(atPath: path)
            if(exists){
                let content = fm.contents(atPath: path)
                let contentAsString = String(data: content!, encoding: String.Encoding.utf8)
                my_textview.text = contentAsString
            }
        }
        
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
        my_textview.text = "HERE"
        
        
    }
    
}

