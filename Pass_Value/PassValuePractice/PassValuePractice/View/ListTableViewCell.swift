//
//  ListTableViewCell.swift
//  PassValuePractice
//
//  Created by WU CHIH WEI on 2019/8/19.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listLabel: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        deleteBtn.layer.borderColor = UIColor.red.cgColor
        
        deleteBtn.layer.borderWidth = 1
        
        deleteBtn.layer.cornerRadius = 5.0
    }

}
