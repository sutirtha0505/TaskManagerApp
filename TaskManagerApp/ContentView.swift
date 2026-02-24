//
//  ContentView.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 24/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userCreatedGroups: [TaskGroup]
    @State private var selection: TaskSection? = .all
    @State private var allTasks : [Task]
    
    init() {
        let saved = PersistenceManager.shared.load()
        _userCreatedGroups = State(initialValue: saved.groups)
        _allTasks = State(initialValue: saved.allTasks)
    }
    
    var body: some View {
        NavigationSplitView {
            
            SidebarView(
                userCreatedGroups: $userCreatedGroups,
                selection: $selection
            )
            
        } detail: {
            
            switch selection {
                
            case .all:
                TaskListView(
                    title: "All Tasks",
                    tasks: $allTasks
                )
                
            case .done:
                TaskListView(
                    title: "Done Tasks",
                    tasks: .constant(allTasks.filter { $0.isCompleted })
                )
                
            case .upcoming:
                TaskListView(
                    title: "Upcoming Tasks",
                    tasks: .constant(allTasks.filter { !$0.isCompleted })
                )
                
            case .list(let taskGroup):
                if let index = userCreatedGroups.firstIndex(where: { $0.id == taskGroup.id }) {
                    TaskListView(
                        title: userCreatedGroups[index].title,
                        tasks: $userCreatedGroups[index].tasks
                    )
                }
                
            case .none:
                Text("Select a section")
            }
        }
        .onChange(of: userCreatedGroups) {
            save()
        }
        .onChange(of: allTasks) {
            save()
        }
    }
    
    private func save() {
        PersistenceManager.shared.save(groups: userCreatedGroups, allTasks: allTasks)
    }
}

#Preview {
    ContentView()
}
