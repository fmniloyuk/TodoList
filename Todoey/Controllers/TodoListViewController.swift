//
//  AppDelegate.swift
//  Todoey
//
//  Created by Faisal Mahmud on 14/02/2020.
//  Copyright (c) 2020 CodelaneIT. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    //An interface to the user’s defaults database, where you store key-value pairs persistently.
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.tittle = "Apple"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.tittle = "Mango"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.tittle = "Chocolate"
        itemArray.append(newItem3)
        

        //        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
        //            itemArray = items
        //        }
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
        cell.textLabel?.text = itemArray[indexPath.row].tittle
        
        if itemArray[indexPath.row].done == true{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK:- Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user click the Add Item button on our UIAlert
            let newItem = Item()
            newItem.tittle = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

