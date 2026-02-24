//
//  TaskSection.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 24/02/26.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable{
    case all
    case done
    case upcoming
    case list(TaskGroup)
    
    var id: String{
        switch self {
        case .all:
            "all"
        case .done:
            "done"
        case .upcoming:
            "upcoming"
        case .list(let taskGroup):
            taskGroup.id.uuidString
        }
    
    }
    var displayName: String{
        
        switch self {
        case .all:
            "All"
        case .done:
            "Done"
        case .upcoming:
            "Upcoming"
        case .list(let taskGroup):
            taskGroup.title
        }
    }
    
    var iconName: String{
        switch self {
        case .all:
            "circle.badge.plus.fill"
        case .done:
            "checkmark.circle.fill"
        case .upcoming:
            "arrow.2.circlepath.circle"
        case .list(let taskGroup):
            taskGroup.tasks.isEmpty ? "folder" : "folder.badge.plus"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
