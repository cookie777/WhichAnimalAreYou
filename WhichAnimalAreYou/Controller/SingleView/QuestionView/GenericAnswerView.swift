//
//  GenericAnswerView.swift
//  WhichAnimalAreYou
//
//  Created by Takayuki Yamaguchi on 2020-12-20.
//

import UIKit

class GenericAnswerView: UIView {
    
    var view : UIView!{
        didSet{
            setConstrains()
        }
    }

    /*
    MARK: - Prepare general views
    - Question label
    - Progress bar
    */
    var questionLable = MiddleLabel(text: "Qeusti Qeust iQeus tiQeust iQe usti")
    var qeustionProgress : UIProgressView = {
        let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    /*
    MARK: - set Layout contraints
    */
    func setConstrains(){
        view.addSubview(questionLable)
        let sa = view.safeAreaLayoutGuide
        questionLable.anchors(
            topAnchor       : sa.topAnchor,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : nil,
            padding         : .init(top: 20, left: 20, right: 20)
        )
  
        view.addSubview(qeustionProgress)
        qeustionProgress.anchors(
            topAnchor       : nil,
            leadingAnchor   : sa.leadingAnchor,
            trailingAnchor  : sa.trailingAnchor,
            bottomAnchor    : sa.bottomAnchor,
            padding: .init(left: 20, bottom: 20, right: 20)
        )
    }
  

}
