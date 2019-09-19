//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Michael Overman on 9/18/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
    }

    @IBAction func addButtonPressed(sender: UIButton) {
        print("Add to-do item: \(itemTextField.text ?? "_")")
        guard let text = itemTextField.text else {
            return
        }
        if text == "" { return }
        todoList.addItem(item: text)
        tableView.reloadData()
        itemTextField.text = ""
    }

}

