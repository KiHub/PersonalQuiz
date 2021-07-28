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
    private func updateUI() {
        for stacView in [singleStackView, multiplyStackView, rangedStackView] {
            stacView?.isHidden = true
            
        }
    }

}
