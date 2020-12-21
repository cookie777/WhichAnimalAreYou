//
//  QuestionViewController.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-15.
//

import UIKit

class QuestionViewController: UIViewController {
  
  
    /*
    MARK: - Instance variables (execpt views)
    */

    var questionIndex = 0
    var answerChosen: [Answer] = []
  
 
    var genericAnswerView = GenericAnswerView()
    var singleAnswerView = SingleAnswerView()
    var multiAnswerView = MultiAnswerView()
    var rangedAnswerView = RangedAnswerView()

  
    /*
    MARK: - viewDidLoad
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        genericAnswerView.view = view
        
        singleAnswerView.view = view
        singleAnswerView.buttons.forEach {$0.addTarget(self, action: #selector(singleAnswerBottonPressed), for: .touchUpInside)}

        multiAnswerView.view = view
        multiAnswerView.answerButton.addTarget(self, action: #selector(multiAnswerBottonPressed), for: .touchUpInside)
        
        rangedAnswerView.view = view
        rangedAnswerView.answerButton.addTarget(self, action: #selector(rangedAnswerBottonPressed), for: .touchUpInside)
        updateUI()

    }
  

    /*
    MARK: - update UI
    */
    func updateUI() {
        singleAnswerView.stackView.isHidden = true
        multiAnswerView.stackView.isHidden = true
        rangedAnswerView.stackView.isHidden = true

        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)

        navigationItem.title = "Question \(questionIndex + 1)"
        genericAnswerView.questionLable.text = currentQuestion.text
        genericAnswerView.qeustionProgress.setProgress(totalProgress, animated: true)

        switch currentQuestion.type {
            case .single:
                singleAnswerView.updateSingleLayout(using: currentAnswers)
            case .multiple:
                multiAnswerView.updateMultiLayout(using: currentAnswers)
            case .ranged:
                rangedAnswerView.updateRangeLayout(using: currentAnswers)
        }
    }
  


  /*
    MARK: - action trigger
   */
  
    @objc func nextQuestion(){
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
        }else{
            if let nextVC = ResultViewController(responses: answerChosen){
                navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
  
    @objc func singleAnswerBottonPressed(_ sender: UIButton){
        let currentAnswers = questions[questionIndex].answers
        if let index = singleAnswerView.buttons.firstIndex(of: sender){
            answerChosen.append(currentAnswers[index])
        }
        nextQuestion()
    }
    
    @objc func multiAnswerBottonPressed(){
        let currentAnswers = questions[questionIndex].answers
        for (sw, ans) in zip(multiAnswerView.switches, currentAnswers){
            if sw.isOn{
                answerChosen.append(ans)
            }
        }
        nextQuestion()
    }
    
    @objc func rangedAnswerBottonPressed(){
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedAnswerView.slider.value*Float(currentAnswers.count-1)))
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }

}
