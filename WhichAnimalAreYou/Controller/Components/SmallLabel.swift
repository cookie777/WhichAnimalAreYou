//
//  SmallLabel.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-19.
//

import UIKit

class SmallLabel: CustomUILabel {

    init(text : String) {
        super.init(text: text, fontSize: 16, alignment: .natural)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
