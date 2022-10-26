//
//  ViewController.swift
//  Checklist
//
//  Created by Vladimir on 16.09.2022.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistItem(text: "Walk the dog", checked: false)
        items.append(item1)
        
        let item2 = ChecklistItem(text: "Brush my teeth", checked: true)
        items.append(item2)
        
        let item3 = ChecklistItem(text: "Learn iOS development", checked: true)
        items.append(item3)
        
        let item4 = ChecklistItem(text: "Soccer practice", checked: false)
        items.append(item4)
        
        let item5 = ChecklistItem(text: "Eat ice cream", checked: false)
        items.append(item5)
    } 
    
    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath){
        
        let item = items[indexPath.row]
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
   
    
    
    // MARK: Указывает источнику данных вернуть количество строк в данном разделе Table View.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return items.count
    }
    // MARK: Запрашивает у источника данных ячейку для вставки в определенное место Table View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        
        let item = items[indexPath.row]
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    //MARK: Deleting cell from Checklist
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    
    
    //MARK: Actions
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = ChecklistItem(text: "I am a new row", checked: true)
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    
}

