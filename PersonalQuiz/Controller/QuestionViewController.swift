//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by  Mr.Ki on 28.07.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - IB outlets
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet var multiplyLables: [UILabel]!
    @IBOutlet var multiplySwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet weak var rangeSlider: UISlider!
    
 
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    // MARK: - Private properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer ] = []
//    private var currentAnswers =  questions[questionIndex].answers
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
    }
    
    

    
   
    
    // MARK: - IB Actions
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender)  else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multiplyAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multiplySwitch,answer) in zip(multiplySwitches, currentAnswers) {
            if multiplySwitch.isOn {
                answersChoosen.append(answer)
           // answersChoosen.append(currentAnswer[in])
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
        
    }
    
    
    // MARK: - Private Methods
    
    
    // MARK: - Update UI
    private func updateUI() {
        // Hide everything
        for stacView in [singleStackView, multiplyStackView, rangedStackView] {
            stacView?.isHidden = true
        }
        // Get current question
        let currentQuestion = questions[questionIndex]
        // Set qurrent question for gurrent label
        questionLabel.text = currentQuestion.text
        
        // Set progress count
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress fo questionProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentAnswer = currentQuestion.answers
        
        
        //Show stack view
        switch currentQuestion.type {
        case .single:
            updataSingleStackView(using: currentAnswer)
        case .multiply:
            updateMultiplyStackView(using: currentAnswer)
        case .ranged:
            updateRangedStackView(using: currentAnswer)
        }
        
    }
    
    
    
    /// Setup singel stackciew
    /// - Parameter answer: array with answers
    ///
    /// Description of method
    private func updataSingleStackView(using answer: [Answer]) {
        //Show singlestackview
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answer) {
            button.setTitle(answer.text, for: .normal)
        }
        
        
//        for (button, answer) in zip(singleButtons, answers) {
//            button.setTitle(answer.text, for: .normal)
//        }
    }
    
    /// Setup multiply stackview
    /// - Parameter answer: array with answrs
    private func updateMultiplyStackView(using answer: [Answer]) {
        
        multiplyStackView.isHidden = false
        
        for (label, answer) in zip(multiplyLables, answer) {
            label.text = answer.text
        }
        
    }
    
    /// Setup ranged stackview
    /// - Parameter answer: array with answrs
    private func updateRangedStackView(using answer: [Answer]) {
        
        rangedStackView.isHidden = false
        
        rangeLabels.first?.text = answer.first?.text
        
    }
    
    // MARK: - Navigation
    // Show next question or go next screen
    private func nextQuestion() {
        // TODO: Implement function
        
        questionIndex += 1
        
        if questionIndex < questions.count {
                updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else {return}
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoosen
        
        
        
        
    }
    

}
