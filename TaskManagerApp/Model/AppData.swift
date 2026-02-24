//
//  AppData.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 25/02/26.
//

struct AppData: Codable {
    var groups: [TaskGroup]
    var allTasks: [Task]
}
