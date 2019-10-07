//
//  ExamViewController.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-10-04.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import Foundation
import UIKit


class ExamViewController : UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var examScrollView: UIScrollView!
    @IBOutlet weak var homeButton: UIToolbar!
    @IBOutlet weak var endExam: UIButton!
    
    var examNumber : Int?
    
    var lines : Array<String> = Array()
    var answers : Array<String> = Array()
    var questions : Array<Array<String> > = Array()
    var slides : Array<Slide> = Array()
    var num : Int = 0

    let blue = UIColor(red: CGFloat(58.0/255.0), green: CGFloat(143.0/255.0), blue: CGFloat(215.0/255.0), alpha: CGFloat(1))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (examNumber == 0) {
            lines = getLines(fileName: "MarketingExamQuestions")
            answers = getLines(fileName: "MarketingExamAnswers")
        }
        else if (examNumber == 1) {
            lines = getLines(fileName: "FinanceExamQuestions")
            answers = getLines(fileName: "FinanceExamAnswers")
        }
        else if (examNumber == 2) {
            lines = getLines(fileName: "HospitalityExamQuestions")
            answers = getLines(fileName: "HospitalityExamAnswers")
        }
        else if (examNumber == 3) {
            lines = getLines(fileName: "BusinessAdminExamQuestions")
            answers = getLines(fileName: "BusinessAdminExamAnswers")
        }
        
        initQuestions()
        slides = createSlides()
        initSlideScrollView(slides: slides)
        examScrollView.delegate = self
        
    }
    @IBAction func onHomeClicked(_ sender: Any) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func getLines(fileName: String) -> [String] {
        if let path = Bundle.main.path(forResource: fileName, ofType: "txt")
        {
            let fm = FileManager()
            if (fm.fileExists(atPath: path)) {
                let content = String(data: fm.contents(atPath: path)!, encoding: String.Encoding.utf8)
                return content!.components(separatedBy: "\n")
            }
        }
        return [];
    }
    func initQuestions() {
        num = min(lines.count / 5, 100)
        var visited: [Bool] = []
        var n: Int
        for _ in 0..<lines.count/5 {
            visited.append(false)
        }
        
        for _ in 0..<num {
            n = Int.random(in: 0...lines.count/5-1)
            while visited[n] {
                n = Int.random(in: 0...lines.count/5-1)
            }
            visited[n] = true
            questions.append([String(n), "Z"])
        }
        
    }
    func createSlides() -> [Slide] {
        var s: [Slide] = []
        for i in 0..<100 {
            let temp:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let questionNumber = Int(questions[i][0])!
            let questionText = lines[questionNumber*5]
            temp.questionText.text = String(i+1)+". "+String(questionText[questionText.index(questionText.startIndex, offsetBy: 3)..<questionText.endIndex])
            temp.firstResponse.setTitle(lines[questionNumber*5+1], for: .normal)
            temp.firstResponse.sizeToFit()
            temp.firstResponse.addTarget(self, action: #selector(ExamViewController.buttonTapped1(_:)), for: .touchUpInside)
            temp.secondResponse.setTitle(lines[questionNumber*5+2], for: .normal)
            temp.secondResponse.addTarget(self, action: #selector(ExamViewController.buttonTapped2(_:)), for: .touchUpInside)
            temp.thirdResponse.setTitle(lines[questionNumber*5+3], for: .normal)
            temp.thirdResponse.addTarget(self, action: #selector(ExamViewController.buttonTapped3(_:)), for: .touchUpInside)
            temp.fourthResponse.setTitle(lines[questionNumber*5+4], for: .normal)
            temp.fourthResponse.addTarget(self, action: #selector(ExamViewController.buttonTapped4(_:)), for: .touchUpInside)
            temp.questionText.setContentOffset(.zero, animated: true)
            s.append(temp)
            
        }
        return s
    }
    func initSlideScrollView(slides : [Slide]) {
        examScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        examScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        examScrollView.isPagingEnabled = true
        examScrollView.bounces = false
        
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            examScrollView.addSubview(slides[i])
        }
    }
    @objc func buttonTapped1(_ sender : UIButton) {
        selectedColourChange()
        sender.backgroundColor = UIColor.purple
        questions[getSlide()][1] = "A"
    }
    @objc func buttonTapped2(_ sender : UIButton) {
        selectedColourChange()
        sender.backgroundColor = UIColor.purple
        questions[getSlide()][1] = "B"
    }
    @objc func buttonTapped3(_ sender : UIButton) {
        selectedColourChange()
        sender.backgroundColor = UIColor.purple
        questions[getSlide()][1] = "C"
    }
    @objc func buttonTapped4(_ sender : UIButton) {
        selectedColourChange()
        sender.backgroundColor = UIColor.purple
        questions[getSlide()][1] = "D"
    }
    func selectedColourChange() {
        let choice: String = questions[getSlide()][1]
        if (choice != "Z") {
            if (choice == "A") {
                slides[getSlide()].firstResponse.backgroundColor = blue
            }
            else if (choice == "B") {
                slides[getSlide()].secondResponse.backgroundColor = blue
            }
            else if (choice == "C") {
                slides[getSlide()].thirdResponse.backgroundColor = blue
            }
            else if (choice == "D"){
                slides[getSlide()].fourthResponse.backgroundColor = blue
            }
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    func getSlide() -> Int {
        return Int(examScrollView.contentOffset.x/view.frame.width)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        var wrong: Array<Array<String> > = Array()
        guard let navigationController = segue.destination as? UINavigationController
        else {
            return
        }
        if let endGameViewController = navigationController.viewControllers.first as? EndGameViewController {
            endGameViewController.questions = questions
            var correct = 0
            for i in 0..<num {
                if answers[Int(questions[i][0])!].prefix(1) == questions[i][1] {
                    correct += 1
                }
                else {
                    wrong.append([questions[i][0], questions[i][1], String(i)])
                }
            }
            endGameViewController.score = correct
            endGameViewController.wrong = wrong
            endGameViewController.lines = lines
            endGameViewController.answers = answers
        }
        
    }
}
