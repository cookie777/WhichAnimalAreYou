//
//  QuestionViewController.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-15.
//

import UIKit

class QuestionViewController: UIViewController {
  
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
//      bt.addTarget    (self       , action: #selector(btPressed), for: .touchUpInside)
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
  lazy var multiSets : [UIStackView] = {
    var sets : [UIStackView] = []
    for i in 0...3{
      let set = UIStackView(arrangedSubviews: [muitiLables[i],muitiSwitches[i]])
      set.axis = .horizontal
      set.alignment = .fill
      set.distribution = .fill
      sets += [set]
    }
    return sets
  }()
  var multiAnswerButton : UIButton = {
    let bt = UIButton()
    bt.setTitle     ("Submit Answer" , for: .normal)
    bt.setTitleColor(.systemBlue, for: .normal)
    bt.setTitleColor(.systemTeal    , for: .highlighted)
//      bt.addTarget    (self       , action: #selector(btPressed), for: .touchUpInside)
    return bt
  }()
  
  lazy var multiStackView : UIStackView = {
    let sv = UIStackView(arrangedSubviews: multiSets+[multiAnswerButton])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis         = .vertical
    sv.alignment    = .fill
    sv.distribution = .fill
    sv.spacing      = 20
    return sv
  }()
  
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white


//    setSingleLayout()
    setMultiLayout()
    
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
  
  
  

}
