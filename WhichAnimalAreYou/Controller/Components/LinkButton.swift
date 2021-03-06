//
//  LinkButton.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-19.
//

import UIKit

class LinkButton: UIButton {
    
    init(text : String = "") {
        super.init(frame: .zero)
        self.setTitle     (text , for: .normal)
        self.setTitleColor(.systemBlue, for: .normal)
        self.setTitleColor(.systemTeal    , for: .highlighted)
        self.titleLabel?.font =  UIFont(name: "Inter-Regular", size: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
