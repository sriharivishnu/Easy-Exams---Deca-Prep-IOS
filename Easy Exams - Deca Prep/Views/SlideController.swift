//
//  Slide.swift
//  Easy Exams - Deca Prep
//
//  Created by Srihari Vishnu on 2018-10-05.
//  Copyright © 2018 Srihari Vishnu. All rights reserved.
//

import UIKit

class Slide: UIView {
    @IBOutlet var firstResponse: UIButton!
    @IBOutlet var secondResponse: UIButton!
    @IBOutlet var thirdResponse: UIButton!
    @IBOutlet var fourthResponse: UIButton!
    @IBOutlet weak var questionText: UITextView!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func createSlides() -> [Slide] {
        let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide.questionText.text = "Test"
        return [slide];
    }
    

}
