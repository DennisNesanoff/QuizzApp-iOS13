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
    var questions: [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a tree?", image: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a dog?", image: UIImage(named: "car")!),
        QuizQuestion(correctAnswer: false, question: "Is this a person?", image: UIImage(named: "mug")!)
    ]
    
    private var score = 0
    private var questionIndex = 0
    
    func getScore() -> String {
        return "\(score) \\ \(questions.count)"
    }
}
