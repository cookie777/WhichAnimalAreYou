//
//  SmallLabel.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-19.
//

import UIKit

class SmallLabel: CustomUILabel {

    init(text : String) {
        super.init(text: text, fontSize: 16, fontFamily: "Inter-ExtraLight", alignment: .natural)
        self.lineSpacing(spacingValue: 8)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
