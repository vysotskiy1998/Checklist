//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Vladimir on 07.10.2022.
//

import UIKit


protocol AddItemViewControllerDelegate: AnyObject {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}
    

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    
    weak var delegate: AddItemViewControllerDelegate?
    
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK: Убирает выделение ячейки
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    
    @IBAction func done(_ sender: Any) {
        let item = ChecklistItem()
        item.text = textField.text!
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    //MARK: Метод что бы когда поле пустое кнопка Done становилась не активной
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        newText.isEmpty ? (doneBarButton.isEnabled = false) : (doneBarButton.isEnabled = true)
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
 
