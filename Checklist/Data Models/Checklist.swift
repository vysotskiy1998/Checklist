//
//  Checklist.swift
//  Checklist
//
//  Created by Vysotskiy Vladimir on 21.11.2022.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var iconName = ""
    
    var name: String = ""
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
    
}
