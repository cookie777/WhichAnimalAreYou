//
//  ResultViewController.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-16.
//

import UIKit

class ResultViewController: UIViewController {

    
    var responses : [Answer]
    var resultView = ResultView()
    var mostCommonAnswer : AnimalType! {
        didSet{
            resultView.answerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultView.definitionLabel.text = mostCommonAnswer.definition
        }
    }

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
        
        resultView.view = view
        setNavigationLayout()
        mostCommonAnswer = calculatePersonalityResult(responses: responses)
    }

    func setNavigationLayout() {
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
    }
  
    @objc func doneButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}
