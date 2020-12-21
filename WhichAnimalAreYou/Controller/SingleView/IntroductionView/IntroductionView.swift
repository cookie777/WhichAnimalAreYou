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
            padding         : .init(left: 8, right: 8)
        )
        mainStackView.centerYinSafeArea(view)
    }
  
    /*
    MARK: - set emoji layout
    */
    var dogEmoji : Emoji!
    var catEmoji : Emoji!
    var rabbitEmoji : Emoji!
    var turtleEmoji : Emoji!

    func setEmoji(){
        dogEmoji = Emoji(emoji: "🐶", parentView: view, top: 0, left: 20, bottom: nil, right: nil)
        catEmoji = Emoji(emoji: "🐱", parentView: view, top: 0, left: nil, bottom: nil, right: 20)
        rabbitEmoji = Emoji(emoji: "🐰", parentView: view, top: nil, left: 20, bottom: 0, right: nil)
        turtleEmoji = Emoji(emoji: "🐢", parentView: view, top: nil, left: nil, bottom: 0, right: 20)
    }

}

