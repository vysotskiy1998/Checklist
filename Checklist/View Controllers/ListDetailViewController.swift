//
//  ListDetailViewController.swift
//  Checklist
//
//  Created by Vysotskiy Vladimir on 29.11.2022.
//

import UIKit

protocol ListDetailViewControllerDelegate: AnyObject {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var iconImage: UIImageView!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
        } else {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishAdding: checklist)
        }
    }
    
    
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
    
    //MARK: Убирает выделение ячейки
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.section == 1 ? indexPath : nil
    }
    
}
