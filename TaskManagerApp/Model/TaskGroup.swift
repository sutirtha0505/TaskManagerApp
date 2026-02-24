//
//  TaskGroup.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 24/02/26.
//

import Foundation

struct TaskGroup: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var creationDate: Date
    var tasks: [Task]
    
    init(title: String, tasks: [Task] = []) {
        self.title = title
        self.creationDate = Date()
        self.tasks = tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(id: UUID(), title: "Buy groceries")
        let task2 = Task(id: UUID(), title: "Read a book")
        let task3 = Task(id: UUID(), title: "Workout")
        
        var group = TaskGroup(title: "Personal")
        group.tasks = [task1, task2, task3]
        return group
    }
    
    static func example2() -> TaskGroup {
        let task1 = Task(id: UUID(), title: "Ride the Motorcycle")
        let task2 = Task(id: UUID(), title: "Learn Swift")
        let task3 = Task(id: UUID(), title: "Plan a vacation on Darjeeling")
        
        var group = TaskGroup(title: "Hobbies")
        group.tasks = [task1, task2, task3]
        return group
    }
    
    static func example3() -> TaskGroup {
        let task1 = Task(id: UUID(), title: "Finish handling of API response in the C client")
        let task2 = Task(id: UUID(), title: "Finish the upgradation of the Django Client of the Backend")
        let task3 = Task(id: UUID(), title: "Fix the bug in the Swift Package Manager")
        
        var group = TaskGroup(title: "Work")
        group.tasks = [task1, task2, task3]
        return group
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup.example2()
        let group3 = TaskGroup.example3()
        return [group1, group2, group3]
    }
    
}
