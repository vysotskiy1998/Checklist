//
//  DataModel.swift
//  Checklist
//
//  Created by Vysotskiy Vladimir on 08.12.2022.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklist()
        registerDefaults()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklist.plist")
    }
    
    func saveChecklist() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
                print("Error encoding lists array \(error.localizedDescription)")
        }
    }
    
    func loadChecklist() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding list array: \(error.localizedDescription)")
            }
        }
    }
    
    func registerDefaults() {
        let dictionary = ["ChecklistIndex": -1]
        UserDefaults.standard.register(defaults: dictionary)
    }
}
