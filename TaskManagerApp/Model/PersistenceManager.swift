//
//  PersistenceManager.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 25/02/26.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private init() {}
    
    private var fileURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documents.appendingPathComponent("tasks_data.json")
    }
    
    func save(groups: [TaskGroup], allTasks: [Task]) {
        let container = AppData(groups: groups, allTasks: allTasks)
        
        do {
            let data = try JSONEncoder().encode(container)
            try data.write(to: fileURL)
        } catch {
            print("Save Failed: ", error)
        }
    }
    
    func load() -> AppData {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode(AppData.self, from: data)
        } catch {
            print("No existing data found. Starting fresh.")
            return AppData(groups: [], allTasks: [])
        }
    }
}
