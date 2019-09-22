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
    var lines : Array<String> = Array()
    var answers : Array<String> = Array()
    var questions : Array<Array<String> > = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        lines = getLines(fileName: "MarketingExamQuestions")
        answers = getLines(fileName: "MarketingExamAnswers")
        initQuestions()
        let slides = createSlides()
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
        let num = min(lines.count / 5, 100)
        var visited: [Bool] = []
        var n: Int
        for _ in 0...lines.count/5 {
            visited.append(false)
        }
        
        for _ in 0...num {
            n = Int.random(in: 0...lines.count/5)
            while visited[n] {
                n = Int.random(in: 0...lines.count/5)
            }
            visited[n] = true
            questions.append([String(n), "Z"])
        }
        
    }
    func createSlides() -> [Slide] {
        var s: [Slide] = []
        for i in 0...100 {
            let temp:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let questionNumber = Int(questions[i][0])!
            let questionText = lines[questionNumber*5]
            temp.questionText.text = String(i+1)+". "+String(questionText[questionText.index(questionText.startIndex, offsetBy: 3)..<questionText.endIndex])
            temp.firstResponse.setTitle(lines[questionNumber*5+1], for: .normal)
            temp.secondResponse.setTitle(lines[questionNumber*5+2], for: .normal)
            temp.thirdResponse.setTitle(lines[questionNumber*5+3], for: .normal)
            temp.fourthResponse.setTitle(lines[questionNumber*5+4], for: .normal)
            s.append(temp)
            
        }
//        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide1.firstResponse.setTitle("YESS", for: .normal)
//        slide1.firstResponse.addTarget(self, action: #selector(ExamViewController.buttonTapped(_:)), for: .touchUpInside)
//        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options:nil)?.first as! Slide
//        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options:nil)?.first as! Slide
//        s.append(slide1)
//        s.append(slide2)
//        s.append(slide3)
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
    @objc func buttonTapped(_ sender : UIButton) {
        homeButton.barTintColor = UIColor.green
    }
}
