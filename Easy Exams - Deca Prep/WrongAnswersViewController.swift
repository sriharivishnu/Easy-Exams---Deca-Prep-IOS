//
//  WrongAnswersViewController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2019-09-23.
//  Copyright © 2019 Srihari Vishnu. All rights reserved.
//

import UIKit

class WrongAnswersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var wrongAnswersTable: UITableView!
    
    @IBOutlet weak var wrongAnswersTableView: UITableView!
    
    var wrong: Array<Array<String> >?
    var lines: Array<String>?
    var answers: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        wrongAnswersTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrong!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : WrongAnswersCell = tableView.dequeueReusableCell(withIdentifier: "WrongAnswerCell", for: indexPath) as! WrongAnswersCell
        let r: Int = indexPath.row
        let questionText = lines![5*Int(wrong![r][0])!]
        let formattedQuestion = wrong![r][2]+". "+String(questionText[questionText.index(questionText.startIndex, offsetBy: 3)..<questionText.endIndex])
        cell.question?.text = formattedQuestion
        cell.one?.text = lines![5*Int(wrong![r][0])!+1]
        cell.two?.text = lines![5*Int(wrong![r][0])!+2]
        cell.three?.text = lines![5*Int(wrong![r][0])!+3]
        cell.four?.text = lines![5*Int(wrong![r][0])!+4]
        
        cell.one?.textColor = UIColor.black
        cell.two?.textColor = UIColor.black
        cell.three?.textColor = UIColor.black
        cell.four?.textColor = UIColor.black
        
        if (wrong![r][1] == "A") {
            cell.one?.textColor = UIColor.red
        }
        else if (wrong![r][1] == "B") {
            cell.two?.textColor = UIColor.red
        }
        else if (wrong![r][1] == "C") {
            cell.three?.textColor = UIColor.red
        }
        else if (wrong![r][1] == "D") {
            cell.four?.textColor = UIColor.red
        }
        else {
            cell.question?.text = "(UNANSWERED) " + formattedQuestion
        }
        
        if (answers![Int(wrong![r][0])!].prefix(1) == "A") {
            cell.one?.textColor = UIColor.green
        }
        else if (answers![Int(wrong![r][0])!].prefix(1) == "B") {
            cell.two?.textColor = UIColor.green
        }
        else if (answers![Int(wrong![r][0])!].prefix(1) == "C") {
            cell.three?.textColor = UIColor.green
        }
        else if (answers![Int(wrong![r][0])!].prefix(1) == "D") {
            cell.four?.textColor = UIColor.green
        }
        print (r, wrong![r][1])
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
