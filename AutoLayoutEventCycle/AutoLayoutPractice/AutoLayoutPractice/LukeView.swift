//
//  LukeView.swift
//  AutoLayoutPractice
//
//  Created by WU CHIH WEI on 2020/1/15.
//  Copyright © 2020 WU CHIH WEI. All rights reserved.
//

import UIKit

class LukeView: UIView {

    @IBOutlet weak var redCircleView: UIView!
    
    @IBOutlet weak var purpleCircleView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        redCircleView.layer.cornerRadius = redCircleView.frame.width * 0.5
        
        purpleCircleView.layer.cornerRadius = purpleCircleView.frame.width * 0.5
    }
}
