//
//  Checklist.swift
//  Checklist
//
//  Created by Vysotskiy Vladimir on 21.11.2022.
//

import UIKit

class Checklist: NSObject, Codable {
    
    var name: String
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
