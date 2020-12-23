//
//  LargeLabelView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-19.
//

import UIKit

class LargeLabel: CustomUILabel {
    
    init(text : String) {
        super.init(text: text, fontSize: 40, fontFamily: "Inter-Black", alignment: .center)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
