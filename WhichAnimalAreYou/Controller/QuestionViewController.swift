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
  var questionLable : UILabel  = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.text          = "Qeusti Qeust iQeus tiQeust iQe usti"
    lb.font          = .systemFont(ofSize: 32)
    lb.textAlignment = .center
    lb.numberOfLines = 0
    lb.lineBreakMode = .byWordWrapping
    return lb
  }()
  
  var qeustionProgress : UIProgressView = {
    let pv = UIProgressView()
    pv.translatesAutoresizingMaskIntoConstraints = false
    return pv
  }()
  
  
  /*
    MARK: - Prepare single answer views
   */
  var singleButtons : [UIButton]  = {
    var bts: [UIButton] = []
    for _ in 0...3{
      let bt = UIButton()
      bt.setTitle     ("button" , for: .normal)
      bt.setTitleColor(.systemBlue, for: .normal)
      bt.setTitleColor(.systemTeal    , for: .highlighted)
      bt.addTarget    (self       , action: #selector(singleAnswerBottonPressed), for: .touchUpInside)
      bts += [bt]
    }
    return bts
  }()
  
  lazy var singleStackView : UIStackView = {
    let sv = UIStackView(arrangedSubviews: singleButtons)
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis         = .vertical
    sv.alignment    = .center
    sv.distribution = .fill
    sv.spacing      = 20
    return sv
  }()
  
  
  
  /*
    MARK: - Prepare mulpiple answer views
   */
  var muitiLables : [UILabel]  = {
    var lbs: [UILabel] = []
    for _ in 0...3{
      let lb = UILabel()
      lb.text          = "lb"
      lb.font          = .systemFont(ofSize: 16)
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
      let pair = UIStackView(arrangedSubviews: [muitiLables[i],muitiSwitches[i]])
      pair.axis = .horizontal
      pair.alignment = .fill
      pair.distribution = .fill
      pairs += [pair]
    }
    return pairs
  }()
  var multiAnswerButton : UIButton = {
    let bt = UIButton()
    bt.setTitle     ("Submit Answer" , for: .normal)
    bt.setTitleColor(.systemBlue, for: .normal)
    bt.setTitleColor(.systemTeal    , for: .highlighted)
    bt.addTarget    (self       , action: #selector(multiAnswerBottonPressed), for: .touchUpInside)
    return bt
  }()
  
  lazy var multiStackView : UIStackView = {
    let sv = UIStackView(arrangedSubviews: multiPairs+[multiAnswerButton])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis         = .vertical
    sv.alignment    = .fill
    sv.distribution = .fill
    sv.spacing      = 20
    return sv
  }()
  
  
  /*
    MARK: - Prepare range answer views
   */
  var rangeSlider : UISlider = {
    let sl = UISlider()
    return sl
  }()
  var rangeLables : [UILabel]  = {
    var lbs: [UILabel] = []
    for _ in 0...1{
      let lb = UILabel()
      lb.text          = "Label"
      lb.font          = .systemFont(ofSize: 16)
      lbs += [lb]
    }
    return lbs
  }()
  lazy var rangeLablesStackView : UIStackView = {
    var sv = UIStackView(arrangedSubviews: rangeLables)
    sv.axis = .horizontal
    sv.alignment = .fill
    sv.distribution = .equalSpacing
    return sv
  }()
  var rangeButton : UIButton  = {
    let bt = UIButton()
    bt.setTitle     ("Submit Answer" , for: .normal)
    bt.setTitleColor(.systemBlue, for: .normal)
    bt.setTitleColor(.systemTeal    , for: .highlighted)
      bt.addTarget    (self       , action: #selector(rangeAnswerBottonPressed), for: .touchUpInside)
    return bt
  }()
  lazy var rangeStackView : UIStackView = {
    let sv = UIStackView(arrangedSubviews: [rangeSlider, rangeLablesStackView, rangeButton])
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
    NSLayoutConstraint.activate([
      questionLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      questionLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      questionLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
    view.addSubview(qeustionProgress)
    NSLayoutConstraint.activate([
      qeustionProgress.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      qeustionProgress.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      qeustionProgress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
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
    view.addSubview(rangeStackView)
    NSLayoutConstraint.activate([
      rangeStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      rangeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      rangeStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }
  
  /*
    MARK: - update UI
   */
  func updateUI() {
    singleStackView.isHidden = true
    multiStackView.isHidden = true
    rangeStackView.isHidden = true
    
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
    rangeStackView.isHidden = false
    rangeSlider.setValue(0.5, animated: false) // initialize slider to center
    rangeLables[0].text = answers.first?.text
    rangeLables[1].text = answers.last?.text
  }
  

  /*
    MARK: - action trigger
   */
  
  func nextQuestion(){
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
  @objc func rangeAnswerBottonPressed(){
    let currentAnswers = questions[questionIndex].answers
    let index = Int(round(rangeSlider.value*Float(currentAnswers.count-1)))
    answerChosen.append(currentAnswers[index])
    nextQuestion()
  }

}
