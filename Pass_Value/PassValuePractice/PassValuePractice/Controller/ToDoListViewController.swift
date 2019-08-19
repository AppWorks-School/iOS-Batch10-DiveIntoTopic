//
//  ToDoListViewController.swift
//  PassValuePractice
//
//  Created by WU CHIH WEI on 2019/8/19.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {

    var datas: [String] = ["1", "2", "3", "4", "5"]
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let listCell = cell as? ListTableViewCell else { return cell }
        
        listCell.listLabel.text = datas[indexPath.row]
        
        return listCell
    }
}

extension ToDoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let addItemVC = mainStoryboard.instantiateViewController(
            withIdentifier: "AddItemViewController"
            ) as? AddItemViewController else {
                
                return
        }
        
        addItemVC.text = datas[indexPath.row]
        
        addItemVC.touchHandler = { [weak self] text in
            
            self?.datas[indexPath.row] = text
            
            tableView.reloadData()
        }
        
        show(addItemVC, sender: nil)
    }
}
