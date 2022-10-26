//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Vladimir on 07.10.2022.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
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
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        
        print("Content of the text Field \(textField!)")
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Метод что бы когда поле пустое кнопка Done становилась не активной
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
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
 
