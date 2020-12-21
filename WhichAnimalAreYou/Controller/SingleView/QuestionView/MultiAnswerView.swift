//
//  MultiAnswerView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-20.
//

import UIKit

class MultiAnswerView: UIView {

    var view : UIView!{
        didSet{
            setConstrains()
        }
    }

    var lables : [UILabel]  = {
        var lbs: [UILabel] = []
        for _ in 0...3{
            let lb = SmallLabel(text: "")
            lb.numberOfLines = 1
            lbs += [lb]
        }
        return lbs
    }()
    var switches : [UISwitch]  = {
        var sws: [UISwitch] = []
        for _ in 0...3{
            let sw = UISwitch()
            sw.setOn(false, animated: false)
            sws += [sw]
        }
        return sws
    }()
    
    lazy var pairs : [UIStackView] = {
        var sv: [UIStackView] = []
        for i in 0...3{
            sv += [HorizontalStackView(arrangedSubviews: [lables[i],switches[i]])]
        }
        return sv
    }()

    var answerButton =  LinkButton(text: "Submit button")
  
    lazy var stackView = VerticalStackView(arrangedSubviews: pairs+[answerButton], spacing: 20)
    
    func setConstrains(){
        view.addSubview(stackView)
        let sa = view.safeAreaLayoutGuide
        stackView.anchors(
            topAnchor: nil,
            leadingAnchor: sa.leadingAnchor,
            trailingAnchor: sa.trailingAnchor,
            bottomAnchor: nil,
            padding: .init(left: 20, right: 20)
        )
        stackView.centerYinSafeArea(view)
    }
    
    func updateMultiLayout(using answers: [Answer]) {
        stackView.isHidden = false
        for sw in switches{
          sw.isOn = false // initialize switch to all off
        }
        for (i, lb) in lables.enumerated(){
          lb.text = answers[i].text
        }
    }
  
}
