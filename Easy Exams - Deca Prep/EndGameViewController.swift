//
//  EndGameViewController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2019-09-23.
//  Copyright © 2019 Srihari Vishnu. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    @IBOutlet weak var wrong_answers_button: UIButton!
    
    @IBOutlet weak var new_exam_button: UIButton!
    @IBOutlet weak var full_exam_button: UIButton!
    
    @IBOutlet weak var show_score: UILabel!
    
    var questions: Array<Array<String> >?
    var wrong: Array<Array<String> >?
    var lines: Array<String>?
    var score: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (score != nil) {
            show_score.text = String(score!) + "/100"
        }
        else {
            show_score.text = "Score not found"
        }
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let target = segue.destination as? WrongAnswersViewController {
            target.wrong = wrong
            target.lines = lines
        }
    }
    

}
