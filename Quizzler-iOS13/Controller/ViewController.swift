//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabelBox: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var firstAnswerBtn: UIButton!
    @IBOutlet var secondAnswerBtn: UIButton!
    @IBOutlet var thirdAnswerBtn: UIButton!
    @IBOutlet var scoreBoard: UILabel!
    
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        scoreBoard.text = "Score: 0"
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
      
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
       
        if userGotItRight {
            print("Right!")
            sender.backgroundColor = UIColor.green
        } else {
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.trackQuestions()
        scoreBoard.text = "Score: \(quizBrain.getScore())"
      
        
    }
    
    

 @objc func updateUI() {

    questionLabelBox.text = quizBrain.getQuestionText()
    
    firstAnswerBtn.setTitle("\(quizBrain.answers(number: 0))", for: .normal)
    secondAnswerBtn.setTitle("\(quizBrain.answers(number: 1))", for: .normal)
    thirdAnswerBtn.setTitle("\(quizBrain.answers(number: 2))", for: .normal)
    
    firstAnswerBtn.backgroundColor = UIColor.clear
    secondAnswerBtn.backgroundColor = UIColor.clear
    thirdAnswerBtn.backgroundColor = UIColor.clear
    
    progressBar.progress = quizBrain.getProgress()
    }

}

