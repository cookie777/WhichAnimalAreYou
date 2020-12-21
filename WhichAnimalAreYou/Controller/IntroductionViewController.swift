//
//  ViewController.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-15.
//

import UIKit

class IntroductionViewController: UIViewController {
  

  var introductionView = IntroductionView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    introductionView.view = view
    introductionView.startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
  }
  

  @objc func startButtonPressed(){
    let nv = UINavigationController(rootViewController: QuestionViewController())
    self.present(nv, animated: true, completion: nil)
  }


}

