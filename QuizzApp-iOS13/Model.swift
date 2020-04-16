//
//  Model.swift
//  QuizzApp-iOS13
//
//  Created by Dennis Nesanoff on 15.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

struct QuizQuestion {
    var correctAnswer: Bool
    var question: String
    var image: UIImage
}

class Quiz {
    private var questions: [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a tree?", image: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a dog?", image: UIImage(named: "car")!),
        QuizQuestion(correctAnswer: false, question: "Is this a person?", image: UIImage(named: "mug")!)
    ]
    
    private var score = 0
    private var questionIndex = 0
    
    func getScore() -> String {
        return "\(score) \\ \(questions.count)"
    }
    
    func getQuestion() -> QuizQuestion {
        return questions[questionIndex]
    }
    
    func check(answer: Bool) -> Bool {
        let question = getQuestion()
        
        if question.correctAnswer == answer {
            score += 1
            return true
        }
        
        return false
    }
    
    func nextQuestion() -> Bool {
        if questionIndex < questions.count - 1 {
            questionIndex += 1
            return true
        }
        
        return false
    }
    
    func reset() {
        questionIndex = 0
        score = 0
    }
}
