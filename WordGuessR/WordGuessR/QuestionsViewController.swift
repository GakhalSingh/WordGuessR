//
//  QuestionsViewController.swift
//  WordGuessR
//
//  Created by SD on 04/04/2022.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var currentQuestion: UILabel!
    @IBOutlet weak var questionAnswer: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    var filteredQuestions: [QuizQuestion] = []
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func newQuestion() {
        currentQuestion.text = filteredQuestions[currentQuestionIndex].question
        questionAnswer.text = "🤔🤔🤔"
        nextQuestionButton.isEnabled = false
    }
    
    func displayAnswer(){
        questionAnswer.text = filteredQuestions[currentQuestionIndex].answer
        nextQuestionButton.isEnabled = true
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        displayAnswer()
        showAnswerButton.isEnabled = false
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentQuestionIndex += 1
        if currentQuestionIndex == filteredQuestions.count {
            currentQuestionIndex = 0
        }
        newQuestion()
        showAnswerButton.isEnabled = true
        infoLabel.text = ""
    }


}
