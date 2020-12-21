//
//  singleAnswerView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-20.
//

import UIKit

class SingleAnswerView: UIView {

    var view : UIView!{
        didSet{
            setConstrains()
        }
    }
    
    /*
    MARK: - Prepare single answer views
    */
    var buttons : [UIButton]  = Array(repeating: 0, count: 4).map { _ in LinkButton()}
    lazy var stackView = VerticalStackView(arrangedSubviews: buttons, spacing: 20, alignment: .center)

    func setConstrains() {
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
    
    func updateSingleLayout(using answers: [Answer]) {
        stackView.isHidden = false
        for (i, bt) in buttons.enumerated(){
            bt.setTitle(answers[i].text, for: .normal)
        }
    }

}
