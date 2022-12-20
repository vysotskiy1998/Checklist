//
//  CheckListItem.swift
//  Checklist
//
//  Created by Vladimir on 26.09.2022.
//

import UIKit

class ChecklistItem: NSObject, Codable {
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    var text = ""
    var checked = true
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
