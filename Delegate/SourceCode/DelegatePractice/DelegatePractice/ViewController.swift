//
//  ViewController.swift
//  DelegatePractice
//
//  Created by WU CHIH WEI on 2019/8/19.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

enum ButtonSet: String {
    
    case yellow = "Yellow"
    
    case blue = "Blue"
    
    case red = "Red"
    
    func color() -> UIColor {
        
        switch self {
            
        case .yellow: return .yellow
            
        case .blue: return .blue
        
        case .red: return .red
        
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var topSelectionView: SelectionView! {
        
        didSet {
            
            topSelectionView.dataSource = self
            
            topSelectionView.delegate = self
        }
    }
    
    @IBOutlet weak var bottomSelectionView: SelectionView! {
        
        didSet {
            
            bottomSelectionView.dataSource = self
            
            bottomSelectionView.delegate = self
        }
    }
    
    let topArray: [ButtonSet] = [.red, .yellow]
    
    let bottomArray: [ButtonSet] = [.red, .yellow, .blue]
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.backgroundColor = topArray.first?.color()
        
        bottomView.backgroundColor = bottomArray.first?.color()
    }
}

extension ViewController: SelectionViewDataSource {
    
    func numberOfButtons(in selectionView: SelectionView) -> Int {
        
        if selectionView == topSelectionView {
            
            return topArray.count
        
        } else {
        
            return bottomArray.count
        }
    }
    
    func titleOfButton(_ selectionView: SelectionView, at index: Int) -> String {
        
        if selectionView == topSelectionView {
            
            return topArray[index].rawValue
            
        } else {
            
            return bottomArray[index].rawValue
        }
    }
    
    func colorOfIndicator(_ selectionView: SelectionView) -> UIColor? {
        
        return UIColor.white
    }
}

extension ViewController: SelectionViewDelegate {
    
    func didSelectedButton(_ selectionView: SelectionView, at index: Int) {
    
        if selectionView == topSelectionView {
            
            topView.backgroundColor = topArray[index].color()
            
        } else {
            
            bottomView.backgroundColor = bottomArray[index].color()
        }
    }
    
    func shouldSelectedButton(_ selectionView: SelectionView, at index: Int) -> Bool {
        
        if selectionView == topSelectionView {
            
            return true
            
        } else {
            
            if topSelectionView.selectedIndex == topArray.count - 1 {
                
                return false
            
            } else {
                
                return true
            }
        }
    }
}
