//
//  ViewController.swift
//  WordGuessR
//
//  Created by SD on 14/03/2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var currentQuestion: UILabel!
    @IBOutlet weak var questionAnswer: UILabel!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var loadingBar: UIProgressView!
    
    @IBOutlet weak var redMode: UIButton!
    @IBOutlet weak var greenMode: UIButton!
    @IBOutlet weak var yellowMode: UIButton!
    @IBOutlet weak var blueMode: UIButton!
    @IBOutlet weak var purpleMode: UIButton!
    
    
    var quizQuestions: [QuizQuestion]?
    var hasLoaded = false
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuiz()
    }
    
    @IBAction func test(_ sender: UIButton!) {
        switch sender {
        case redMode:
            print("red")
        case greenMode:
            print("green")
        case yellowMode:
            print("yellow")
        case blueMode:
            print("blue")
        case purpleMode:
            print("purple")
        default:
            break;
        }
    }
    
    func setupQuiz() {
        getLocalQuizData()
        
        
    }
    
    func newQuestion() {
        let questionText = quizQuestions?[currentQuestionIndex].question
        currentQuestion.text = questionText
        questionAnswer.text = "🤔🤔🤔"
        nextQuestionButton.isEnabled = false
        }
    
    func displayAnswer(){
        let questionAnswerText = quizQuestions?[currentQuestionIndex].answer
        questionAnswer.text = questionAnswerText
        nextQuestionButton.isEnabled = true
    }
    
    func getLocalQuizData() {
        // Call readLocalFile function with the name of the local file (localQuizData)
        if let localData = self.readLocalFile(forName: "localQuizData") {
            // File exists, now parse 'localData' with the parse function
            self.parse(jsonData: localData)
        }
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        displayAnswer()
        showAnswerButton.isEnabled = false
    }
    @IBAction func nextQuestion(_ sender: Any) {
        currentQuestionIndex += 1
        if currentQuestionIndex == quizQuestions?.count {
            currentQuestionIndex = 0
        }
        newQuestion()
        showAnswerButton.isEnabled = true
        infoLabel.text = ""
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }

    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([QuizQuestion].self,
                                                       from: jsonData)
            self.quizQuestions = decodedData
        } catch {
            print("decode error")
        }
    }
}
