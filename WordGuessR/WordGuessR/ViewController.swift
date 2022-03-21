//
//  ViewController.swift
//  WordGuessR
//
//  Created by SD on 14/03/2022.
//

import UIKit

class Question  {
    var question: String = "";
    var answer: String = "";
    var category: String = "";
    
    init()  {}
    
    init (question: String, answer: String, category: String)  {
        self.question = question
        self.answer = answer
        self.category = category
    }
    
    func getQuestion()  -> String  {
        return self.question
    }
    func getAnswer()  -> String  {
        return self.answer
    }
    func getCategory()  -> String  {
        return self.category
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var currentQuestion: UILabel!
    @IBOutlet weak var questionAnswer: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var loadingBar: UIProgressView!

    var currentQuestionIndex = 0
    let QuestionArray = [
        Question(question: "Reuzel is gesmolten...", answer: "vet", category: "yellow"),
        Question(question: "De man die een doel verdedigt, noemen we een...", answer: "Keeper", category: "yellow"),
        Question(question: "Welke scheldwoord is een lijster met diarree?", answer: "Een schijtlijster", category: "yellow"),
        Question(question: "Een tien met een griffel en een ... van de juffrouw.", answer: "zoen", category: "yellow"),
        Question(question: "Een bajesklant hoort in de...", answer: "gevangenis", category: "yellow"),
        Question(question: "Een spionnetje is een kleine...", answer: "buitenspiegel", category: "yellow"),
        Question(question: "De tegenstelling van bescheiden is...", answer: "brutaal", category: "yellow"),
        Question(question: "Het binnenste van een appel heet een...", answer: "klokhuis", category: "yellow")]
    
    @IBAction func showAnswer(_ sender: Any) {
        displayAnswer()
        showAnswerButton.isEnabled = false
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentQuestionIndex += 1
        if currentQuestionIndex == QuestionArray.count {
            currentQuestionIndex = 0
        }
        newQuestion()
        showAnswerButton.isEnabled = true
        infoLabel.text = ""
    }
    
    func newQuestion() {
        let questionText = QuestionArray[currentQuestionIndex]
        currentQuestion.text = questionText.question
        questionAnswer.text = "🤔🤔🤔"
        nextQuestionButton.isEnabled = false
        }
    func displayAnswer(){
        let questionText = QuestionArray[currentQuestionIndex]
        questionAnswer.text = questionText.answer
        nextQuestionButton.isEnabled = true
    }

    
}

