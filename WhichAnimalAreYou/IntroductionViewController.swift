//
//  ViewController.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-15.
//

import UIKit

class IntroductionViewController: UIViewController {
  
  /*
    MARK: - Set layout of center label
   */

  var titleLabel : UILabel = {
    let lb = UILabel()
    lb.text          = "Which Animal Are You?"
    lb.textAlignment = .center
    lb.font          = UIFont(name: "Georgia", size: 30)
    
    return lb
  }()
  
  var startButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("Begin Personality Quiz", for: .normal)
    bt.setTitleColor(.systemBlue, for: .normal)
    bt.setTitleColor(.systemTeal   , for: .highlighted)
    bt.titleLabel?.font = .systemFont(ofSize: 15)
    return bt
  }()
  
  lazy var mainStackView : UIStackView = {
    let sv = UIStackView(arrangedSubviews: [titleLabel, startButton])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis         = .vertical
    sv.alignment    = .center
    sv.distribution = .fill
    return sv
  }()
  
  
  /*
    MARK: - viewDidLoad
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setCenterLabel()
    setEmoji()

  }
  
  
  func setCenterLabel(){
    view.addSubview(mainStackView)
    NSLayoutConstraint.activate([
      mainStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0),
      mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
    ])
  }
  
  
  /*
    MARK: - set emoji layout
   */
  
  func createEmjoiLabel(str : String) -> UILabel{
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.text          = str
    lb.textAlignment = .center
    lb.font          = .systemFont(ofSize: 40)
    return lb
  }
  
  func setEmojiConstrain(lb: UILabel,top t: CGFloat?,right r: CGFloat?,bottom b: CGFloat?, left l: CGFloat?){
    view.addSubview(lb)
    if let t = t{
      lb.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: t).isActive = true
    }
    if let r = r{
      lb.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: r).isActive = true
    }
    if let b = b{
      lb.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: b).isActive = true
    }
    if let l = l{
      lb.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: l).isActive = true
    }
  }
  
  func setEmoji(){
    let dogEmoji = createEmjoiLabel(str: "🐶")
    let catEmoji = createEmjoiLabel(str: "🐱")
    let rabbitEmoji = createEmjoiLabel(str: "🐰")
    let turtleEmoji = createEmjoiLabel(str: "🐢")
    setEmojiConstrain(lb: dogEmoji, top: 0, right: nil, bottom: nil, left: 20)
    setEmojiConstrain(lb: catEmoji, top: 0, right: -20, bottom: nil, left: nil)
    setEmojiConstrain(lb: rabbitEmoji, top: nil, right: nil, bottom: 0, left: 20)
    setEmojiConstrain(lb: turtleEmoji, top: nil, right: -20, bottom: 0, left: nil)
    
    dogEmoji.trailingAnchor.constraint(lessThanOrEqualTo: catEmoji.leadingAnchor).isActive = true
    rabbitEmoji.trailingAnchor.constraint(lessThanOrEqualTo: turtleEmoji.leadingAnchor).isActive = true
  }
  
  


}

