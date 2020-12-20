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
  
    /*
    MARK: - Prepare general views
    - Question label
    - Progress bar
    */
    var questionLable = MiddleLabel(text: "Qeusti Qeust iQeus tiQeust iQe usti")
    var qeustionProgress : UIProgressView = {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
  
  
    /*
    MARK: - Prepare single answer views
    */
    lazy var singleButtons : [UIButton]  = {
        var bts: [UIButton] = []
        for _ in 0...3{
            let bt = LinkButton(text: "button")
            bt.addTarget(self, action: #selector(singleAnswerBottonPressed), for: .touchUpInside)
            bts += [bt]
        }
        return bts
    }()
  
    lazy var singleStackView = VerticalStackView(arrangedSubviews: singleButtons, spacing: 20, alignment: .center)
  
  
  
    /*
    MARK: - Prepare mulpiple answer views
    */
    var muitiLables : [UILabel]  = {
        var lbs: [UILabel] = []
        for _ in 0...3{
            let lb = SmallLabel(text: "")
            lb.numberOfLines = 1
            lbs += [lb]
        }
        return lbs
    }()
    var muitiSwitches : [UISwitch]  = {
        var sws: [UISwitch] = []
        for _ in 0...3{
            let sw = UISwitch()
            sw.setOn(false, animated: false)
            sws += [sw]
        }
        return sws
    }()
    lazy var multiPairs : [UIStackView] = {
        var pairs : [UIStackView] = []
        for i in 0...3{
            let pair = HorizontalStackView(arrangedSubviews: [muitiLables[i],muitiSwitches[i]])
            pairs += [pair]
        }
        return pairs
    }()
    var multiAnswerButton : UIButton = {
        let bt = LinkButton(text: "Submit button")
        bt.addTarget    (self       , action: #selector(multiAnswerBottonPressed), for: .touchUpInside)
        return bt
    }()
  
    lazy var multiStackView = VerticalStackView(arrangedSubviews: multiPairs+[multiAnswerButton], spacing: 20)
  
  
  /*
    MARK: - Prepare ranged answer views
   */
    var rangedSlider : UISlider = {
        let sl = UISlider()
        return sl
    }()
    var rangedLables : [UILabel]  = {
        var lbs: [UILabel] = []
        for _ in 0...1{
            let lb = SmallLabel(text: "")
            lb.numberOfLines = 1
            lbs += [lb]
        }
        return lbs
    }()
    lazy var rangedLablesStackView : UIStackView = {
        var sv = UIStackView(arrangedSubviews: rangedLables)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        return sv
    }()
    var rangedButton : UIButton  = {
        let bt = LinkButton(text: "Submit Answer")
        bt.addTarget(self, action: #selector(rangedAnswerBottonPressed), for: .touchUpInside)
        return bt
    }()
    
    lazy var rangedStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [rangedSlider, rangedLablesStackView, rangedButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis         = .vertical
        sv.alignment    = .fill
        sv.distribution = .fill
        sv.spacing      = 20
        return sv
    }()
  
  
  
  
  
    /*
    MARK: - viewDidLoad
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setGeneralLayout()
        setSingleLayout()
        setMultiLayout()
        setRangeLayout()
        updateUI()

    }
  
    /*
    MARK: - set Layout contraints
    */
    func setGeneralLayout(){
        view.addSubview(questionLable)
        let sa = view.safeAreaLayoutGuide
        questionLable.anchors(
            topAnchor       : sa.topAnchor,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : nil,
            padding         : .init(t: 20, l: 20, r: 20)
        )
  
        view.addSubview(qeustionProgress)
        qeustionProgress.anchors(
            topAnchor       : nil,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : sa.bottomAnchor,
            padding: .init(l: 20, b: 20, r: 20)
        )
        
    }
  
    func setSingleLayout() {
        view.addSubview(singleStackView)
        NSLayoutConstraint.activate([
            singleStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            singleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            singleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
  
    func setMultiLayout(){
        view.addSubview(multiStackView)
        NSLayoutConstraint.activate([
            multiStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            multiStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            multiStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
  
    func setRangeLayout(){
        view.addSubview(rangedStackView)
        NSLayoutConstraint.activate([
            rangedStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            rangedStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rangedStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
  
    /*
    MARK: - update UI
    */
    func updateUI() {
        singleStackView.isHidden = true
        multiStackView.isHidden = true
        rangedStackView.isHidden = true

        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)

        navigationItem.title = "Question \(questionIndex + 1)"
        questionLable.text = currentQuestion.text
        qeustionProgress.setProgress(totalProgress, animated: true)

        switch currentQuestion.type {
        case .single:
          updateSingleLayout(using: currentAnswers)
        case .multiple:
          updateMultiLayout(using: currentAnswers)
        case .ranged:
          updateRangeLayout(using: currentAnswers)
        }
    }
  
    func updateSingleLayout(using answers: [Answer]) {
        singleStackView.isHidden = false
        for (i, bt) in singleButtons.enumerated(){
            bt.setTitle(answers[i].text, for: .normal)
        }
    }
    
    func updateMultiLayout(using answers: [Answer]) {
        multiStackView.isHidden = false
        for sw in muitiSwitches{
          sw.isOn = false // initialize switch to all off
        }
        for (i, lb) in muitiLables.enumerated(){
          lb.text = answers[i].text
        }
    }

    func updateRangeLayout(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false) // initialize slider to center
        rangedLables[0].text = answers.first?.text
        rangedLables[1].text = answers.last?.text
    }
  

  /*
    MARK: - action trigger
   */
  
    @objc func nextQuestion(){
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
        }else{
            print(answerChosen)
            if let nextVC = ResultViewController(responses: answerChosen){
                navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
  
    @objc func singleAnswerBottonPressed(_ sender: UIButton){
        let currentAnswers = questions[questionIndex].answers
        if let index = singleButtons.firstIndex(of: sender){
            answerChosen.append(currentAnswers[index])
        }
        nextQuestion()
    }
    @objc func multiAnswerBottonPressed(){
        let currentAnswers = questions[questionIndex].answers
        for i in 0..<muitiSwitches.count {
            if muitiSwitches[i].isOn{
                answerChosen.append(currentAnswers[i])
            }
        }
        nextQuestion()
    }
    @objc func rangedAnswerBottonPressed(){
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value*Float(currentAnswers.count-1)))
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }

}
