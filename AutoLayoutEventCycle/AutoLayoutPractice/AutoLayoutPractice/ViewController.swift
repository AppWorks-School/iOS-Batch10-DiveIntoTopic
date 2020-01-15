//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by WU CHIH WEI on 2020/1/15.
//  Copyright © 2020 WU CHIH WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellowCircleView: LukeView!
    
    @IBOutlet weak var redCircleView: UIView!
    
    @IBOutlet weak var purpleCircleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yellowCircleView.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        yellowCircleView.layer.cornerRadius = yellowCircleView.frame.width * 0.5
        
//        redCircleView.layer.cornerRadius = redCircleView.frame.width * 0.5
//        
//        purpleCircleView.layer.cornerRadius = purpleCircleView.frame.width * 0.5
    }

}

