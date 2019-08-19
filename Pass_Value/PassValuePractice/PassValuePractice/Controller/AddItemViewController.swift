//
//  AddItemViewController.swift
//  PassValuePractice
//
//  Created by WU CHIH WEI on 2019/8/19.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    
    var touchHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTouchButton(_ sender: UIButton) {
        
        guard let text = inputField.text else { return }
        
        touchHandler?(text)
        
        navigationController?.popViewController(animated: true)
    }
}
