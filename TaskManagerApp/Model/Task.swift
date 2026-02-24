//
//  Task.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 24/02/26.
//

import Foundation

struct Task: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date?
    var details: String?
    
    init(id: UUID, title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task {
        Task(id: UUID(), title: "Buy groceries", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(id: UUID(), title: "This is the first Task!!"),
            Task(id: UUID(), title: "This is the second task!!", isCompleted: true),
            Task(id: UUID(), title: "This is the third task!!", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Task(id: UUID(), title: "This is the fourth task!!"),
            Task(id: UUID(), title: "This is the fifth task!!"),
            Task(id: UUID(), title: "This is the sixth task!!"),
            Task(id: UUID(), title: "This is the seventh task!!", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(id: UUID(), title: "This is the eighth task!!"),
            Task(id: UUID(), title: "This is the ninth task!!", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            
            
        ]
    }

}
