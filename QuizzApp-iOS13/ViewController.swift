//
//  ViewController.swift
//  QuizzApp-iOS13
//
//  Created by Dennis Nesanoff on 15.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var quizImage: UIImageView!
    @IBOutlet var questionLabel: UILabel!
    
    let quiz = Quiz()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestion()
    }
    
    private func setupQuestion() {
        let currentQuestion = quiz.getQuestion()
        quizImage.image = currentQuestion.image
        questionLabel.text = currentQuestion.question
    }
    
    @IBAction func buttonDidTouch(_ sender: UIButton) {
        switch sender.currentTitle {
        case "True":
            let result = quiz.check(answer: true)
            showResult(isCorrect: result)
        case "False":
            let result = quiz.check(answer: false)
            showResult(isCorrect: result)
        default:
            break
        }
    }
    
    func showResult(isCorrect correct: Bool) {
        let title = correct ? "Correct" : "Wrong"
        let message = correct ? "You got the righ answer" : "You got the wrong answer"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Next question", style: .default) { _ in
            if self.quiz.nextQuestion() {
                self.setupQuestion()
                alertController.dismiss(animated: true)
            } else {
                alertController.dismiss(animated: true)
                self.showFinalScore()
            }
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    func showFinalScore() {
        let alertController = UIAlertController(title: "Final score", message: quiz.getScore(), preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.quiz.reset()
            self.setupQuestion()
            alertController.dismiss(animated: true)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

