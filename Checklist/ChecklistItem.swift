//
//  CheckListItem.swift
//  Checklist
//
//  Created by Vladimir on 26.09.2022.
//
 
import UIKit

class ChecklistItem {
    var text: String
    var checked: Bool
    init(text: String, checked: Bool) {
        self.text = text
        self.checked  = checked
    }
}
