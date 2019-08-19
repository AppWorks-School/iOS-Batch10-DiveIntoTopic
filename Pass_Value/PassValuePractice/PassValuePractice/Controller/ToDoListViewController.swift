//
//  ToDoListViewController.swift
//  PassValuePractice
//
//  Created by WU CHIH WEI on 2019/8/19.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {

    var datas: [String] = ["1", "2", "3", "4"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem",
           let destinationVC = segue.destination as? AddItemViewController {
            
            destinationVC.touchHandler = { [weak self] text in
                
                self?.datas.append(text)
                
                self?.tableView.reloadData()
            }
        }
    }
}

extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = datas[indexPath.row]
        
        return cell
    }
}

extension ToDoListViewController: UITableViewDelegate {
    
}
