//
//  ResultViewController.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-16.
//

import UIKit

class ResultViewController: UIViewController {

  var responses : [Answer]
  
  var resultAnswerLabel: UILabel  = {
    let lb = UILabel()
    lb.text          = "resultAnswerLabel"
    lb.font          = .systemFont(ofSize: 50)
    lb.textAlignment = .center
    lb.numberOfLines = 0
    lb.lineBreakMode = .byWordWrapping
    return lb
  }()
  var resultDefinitionLabel: UILabel  = {
    let lb = UILabel()
    lb.text          = "resultDefinitionLabel"
    lb.font          = .systemFont(ofSize: 17)
    lb.textAlignment = .center
    lb.numberOfLines = 0
    lb.lineBreakMode = .byWordWrapping
    return lb
  }()
  lazy var resultStackView : UIStackView = {
  let sv = UIStackView(arrangedSubviews: [resultAnswerLabel, resultDefinitionLabel])
  sv.translatesAutoresizingMaskIntoConstraints = false
  sv.axis         = .vertical
  sv.alignment    = .center
  sv.distribution = .fill
  return sv
}()
  
  init?(responses : [Answer]) {
    self.responses = responses
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    setNavigationLayout()
    calculatePersonalityResult()
    setResultLayout()
  }
  
  func setResultLayout() {
    view.addSubview(resultStackView)
    NSLayoutConstraint.activate([
      resultStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      resultStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      resultStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }
  
  func calculatePersonalityResult(){
    let frequencyOfAnswers = responses.reduce(into: [:]){
      $0[$1.type, default: 0] += 1
    }
    let mostCommonAnswer = frequencyOfAnswers.sorted{$0.value > $1.value}.first!.key
    resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.definition
  }
  
  func setNavigationLayout() {
    navigationItem.hidesBackButton = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
  }
  
  @objc func doneButtonPressed(){
    self.dismiss(animated: true, completion: nil)
  }
}
