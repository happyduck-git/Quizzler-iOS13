//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by HappyDuck on 2021/03/27.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        question = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
