//
//  ResulfView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-21.
//

import UIKit

class ResultView: UIView {
    
    weak var view : UIView!{
        didSet{
            setConstrains()
        }
    }

    var answerLabel = LargeLabel(text: "resultAnswerLabel")
    var definitionLabel = SmallLabel(text: "resultDefinitionLabel")
    
    lazy var stackView = VerticalStackView(arrangedSubviews: [answerLabel, definitionLabel], spacing: 0, alignment: .center)
    
    
    func setConstrains() {
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
    

}
