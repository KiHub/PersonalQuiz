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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
       
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
        let totalProgress = Float(questionIndex / questions.count)
        
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
        
        for (button, answer) in (singleButtons, answer) {
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
    }
    
    /// Setup ranged stackview
    /// - Parameter answer: array with answrs
    private func updateRangedStackView(using answer: [Answer]) {
        
        rangedStackView.isHidden = false
    }

}
