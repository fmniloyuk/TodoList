//
//  TodoListViewController.swift
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
    
          let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        
        let newItem = Item()
        newItem.title = "Apple"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Mango"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Chocolate"
        itemArray.append(newItem3)
        
        loadItems()
        
//        if let items = defaults.array(forKey: "ToDolistArry") as? [Item]{
//            itemArray = items
//        }
        

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
        
        let item = itemArray[indexPath.row]
        
        //Insert data to the cell
        cell.textLabel?.text = item.title
        
//        if itemArray[indexPath.row].done == true{
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if itemArray[indexPath.row].done == false{
//            itemArray[indexPath.row].done = true
//        }else {
//            itemArray[indexPath.row].done = false
//        }
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK:- Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user click the Add Item button on our UIAlert
            
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let newItem = Item(context: context)
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            let encoder = PropertyListEncoder()
//
//            do{
//                let data = try encoder.encode(self.itemArray)
//                try data.write(to: self.dataFilePath!)
//            } catch {
//                print("Error encoding item array, \(error)")
//            }
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Model Manupulation Methods
    
    func saveItems() {
//        let encoder = PropertyListEncoder()
//
//        do{
//            let data = try encoder.encode(self.itemArray)
//            try data.write(to: dataFilePath!)
//        } catch {
//            print("Error encoding item array, \(error)")
//        }
//        self.tableView.reloadData()
    }
    
    func loadItems() {
//        if let data = try? Data(contentsOf: dataFilePath!){
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                 print("Error decoding item array, \(error)")
//            }
//        }
    }
}

