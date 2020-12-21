//
//  CustomUILabel.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-20.
//

import UIKit

class CustomUILabel: UILabel {

    init(text: String = "", fontSize: CGFloat  = 16, fontFamily:String? = nil ,alignment:NSTextAlignment = .natural ){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text          = text
        if let fontFamily = fontFamily{
            self.font          = UIFont(name: fontFamily, size:fontSize)
        }else{
            self.font          = .systemFont(ofSize: fontSize)
        }
        self.textAlignment = alignment
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
