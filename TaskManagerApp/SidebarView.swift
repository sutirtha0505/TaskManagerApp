//
//  SidebarView.swift
//  TaskManagerApp
//
//  Created by Tirtharaj Karmakar on 24/02/26.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection?
    
    var body: some View {
        List(selection: $selection) {
            
            Section("Favourites") {
                ForEach(TaskSection.allCases) { section in
                    Label(
                        section.displayName,
                        systemImage: section.iconName
                    )
                    .tag(section)
                }
            }
            
            Section("Your Groups") {
                ForEach($userCreatedGroups) { $group in
                    HStack {
                        Image(systemName: group.tasks.isEmpty ? "folder.badge.plus" : "folder")
                        
                        TextField("Group Name",text: Binding(
                            get: { group.title },
                            set: { newValue in group.title = newValue
                                if case .list(let selectedGroup) = selection,
                                   selectedGroup.id == group.id {
                                    selection = .list(group)
                                }
                            }
                        )
                    )
                        .textFieldStyle(.plain)
                    }
                    .tag(TaskSection.list(group))
                }
                .onDelete(perform: deleteGroups)
            }
        }
        .onDeleteCommand{
            deleteSelectedGroup()
        }
        .listStyle(.sidebar)
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                addGroup()
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .padding()
            .buttonStyle(.borderless)
            .accessibility(identifier: "Add Group Button")
            .accessibility(hidden: true)
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
    // Adding group function
    private func addGroup() {
        let newGroup = TaskGroup(title: "New Group")
        userCreatedGroups.append(newGroup)
        selection = .list(newGroup)
    }
    // Delete group function
    private func deleteGroups(at offsets: IndexSet) {
        
        let deleting = offsets.map { userCreatedGroups[$0] }
        
        withAnimation {
            userCreatedGroups.remove(atOffsets: offsets)
        }
        
        if case .list(let selectedGroup) = selection {
            if deleting.contains(where: { $0.id == selectedGroup.id }) {
                selection = .all
            }
        }
    }
    private func deleteSelectedGroup() {
        
        guard case .list(let selectedGroup)? = selection else { return }
        
        if let index = userCreatedGroups.firstIndex(where: { $0.id == selectedGroup.id }) {
            userCreatedGroups.remove(at: index)
            selection = .all
        }
    }
}

#Preview {
    SidebarView(
        userCreatedGroups: .constant(TaskGroup.examples()),
        selection: .constant(.all)
    )
}
