//
//  MiddleLabel.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-19.
//

import UIKit

class MiddleLabel: CustomUILabel {
    
    init(text : String) {
        super.init(text: text, fontSize: 32,fontFamily: "Inter-Black", alignment: .center)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
