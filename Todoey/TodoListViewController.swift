//
//  AppDelegate.swift
//  Todoey
//
//  Created by Faisal Mahmud on 14/02/2020.
//  Copyright (c) 2020 CodelaneIT. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Apple", "Orange juice", "Milk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting the title of tableViewController
        self.title = "Todo List"
    }
    
    
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create a reference of the prototype cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //Insert data to the cell
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
}

