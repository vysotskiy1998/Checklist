//
//  ViewController.swift
//  Checklist
//
//  Created by Vladimir on 16.09.2022.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
    
        let newRowIndex = items.count
          items.append(item)
          let indexPath = IndexPath(row: newRowIndex, section: 0)
          let indexPaths = [indexPath]
          tableView.insertRows(at: indexPaths, with: .automatic)
          navigationController?.popViewController(animated:true)
        
    }
    
    
    
    
    
    
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        item1.checked = true
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = false
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        item4.checked = false
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        item5.checked = false
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
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        if segue.identifier == "AddItem" {
            // 2
            let controller = segue.destination as! AddItemViewController
            // 3
            controller.delegate = self
        }
        
        
    }
}
