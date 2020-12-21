//
//  Emoji.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-21.
//

import UIKit

class Emoji: CustomUILabel {
    
    init(emoji : String, parentView: UIView, top: CGFloat?, left: CGFloat?, bottom: CGFloat?, right: CGFloat?) {
        super.init(text: emoji, fontSize: 40, alignment: .center)
        setConstrains(parentView, top, left, bottom, right)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains(_ parentView: UIView,_ top: CGFloat?,_ left: CGFloat?,_ bottom: CGFloat?,_ right: CGFloat?){
        let sa = parentView.safeAreaLayoutGuide
        parentView.addSubview(self)
        self.anchors(
            topAnchor       : (top      != nil) ? sa.topAnchor      : nil,
            leadingAnchor   : (left     != nil) ? sa.leadingAnchor  : nil,
            trailingAnchor  : (right    != nil) ? sa.trailingAnchor : nil,
            bottomAnchor    : (bottom   != nil) ? sa.bottomAnchor   : nil,
            padding         : .init(top: top, left: left, bottom: bottom, right: right)
        )
    }

}
