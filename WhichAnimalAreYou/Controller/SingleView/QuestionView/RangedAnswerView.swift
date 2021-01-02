//
//  RangedAnswerView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-20.
//

import UIKit

class RangedAnswerView: UIView {

    weak var view : UIView!{
        didSet{
            setConstrains()
        }
    }

    var slider = UISlider()
    var lables : [UILabel]  = {
    var lbs: [UILabel] = []
        for _ in 0...1{
            let lb = SmallLabel(text: "")
            lb.numberOfLines = 1
            lbs += [lb]
        }
        return lbs
    }()
    
    lazy var lablePairs = HorizontalStackView(arrangedSubviews: lables, spacing: 0, distribution: .equalSpacing)

    var answerButton = LinkButton(text: "Submit Answer")

    lazy var stackView = VerticalStackView(
        arrangedSubviews: [slider, lablePairs, answerButton],
        spacing: 20
    )
    
    func setConstrains(){
        self.addSubview(stackView)
        view.addSubview(self)
        self.matchParent()
        
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
    
    func updateRangeLayout(using answers: [Answer]) {
        self.isHidden = false
        self.slider.setValue(0.5, animated: false) // initialize slider to center
        self.lables[0].text = answers.first?.text
        self.lables[1].text = answers.last?.text
    }
}
