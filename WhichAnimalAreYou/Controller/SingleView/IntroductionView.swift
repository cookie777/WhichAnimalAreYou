//
//  IntroductionView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-19.
//

import UIKit

class IntroductionView: UIView {

    
    var view : UIView!{
        didSet{
            setCenterLabel()
            setEmoji()
        }
    }


    /*
     MARK: - Set layout of center label
    */
    var titleLabel  = CustomUILabel( text: "Which anima are you?", fontSize: 32, fontFamily: "Georgia")
    var startButton = LinkButton(text: "Begin Personality Quiz")
  
    lazy var mainStackView : UIStackView = VerticalStackView(arrangedSubviews: [titleLabel, startButton], spacing: 0, alignment: .center)
  
    func setCenterLabel(){
        view.addSubview(mainStackView)
        let sa = view.safeAreaLayoutGuide
        mainStackView.anchors(
            topAnchor       : nil,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : nil,
            padding         : .init(l: 8, r: 8)
        )
        mainStackView.centerYinSafeArea(view)
    }
  
    
    
  
    /*
    MARK: - set emoji layout
    */
    let dogEmoji = LargeLabel(text: "🐶")
    let catEmoji = LargeLabel(text: "🐱")
    let rabbitEmoji = LargeLabel(text: "🐰")
    let turtleEmoji = LargeLabel(text: "🐢")

    func setEmoji(){
        view.addSubview(dogEmoji)
        view.addSubview(catEmoji)
        view.addSubview(rabbitEmoji)
        view.addSubview(turtleEmoji)

        let sa = view.safeAreaLayoutGuide

        dogEmoji.anchors(
            topAnchor       : sa.topAnchor,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : nil,
            bottomAnchor    : nil,
            padding         : .init(t: 0, l: 20)
        )
        catEmoji.anchors(
            topAnchor       : sa.topAnchor,
            leadingAnchor   : nil,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : nil,
            padding         : .init(t:0, r: 20)
        )
        rabbitEmoji.anchors(
            topAnchor       : nil,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : nil,
            bottomAnchor    : sa.bottomAnchor,
            padding         : .init(l:20, b:0)
        )
        turtleEmoji.anchors(
            topAnchor       : nil,
            leadingAnchor   : nil,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : sa.bottomAnchor,
            padding: .init(b:0, r:20)
        )

        dogEmoji.trailingAnchor.constraint(lessThanOrEqualTo: catEmoji.leadingAnchor).isActive = true
        rabbitEmoji.trailingAnchor.constraint(lessThanOrEqualTo: turtleEmoji.leadingAnchor).isActive = true
    }
  

  

}

