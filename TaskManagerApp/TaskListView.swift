import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
    
    var body: some View {
        VStack {
            
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.accent)
                
                Spacer()
                
                Button {
                    addTask()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
            .padding(.horizontal)
            
            List {
                ForEach($tasks) { $task in
                    HStack {
                        Button {
                            task.isCompleted.toggle()
                        } label: {
                            Image(systemName:
                                    task.isCompleted
                                  ? "checkmark.circle.fill"
                                    : "circle"
                            )
                            .foregroundStyle(.accent)
                        }
                        .buttonStyle(.plain)
                        
                        TextField("Task Title", text: $task.title)
                            .textFieldStyle(.plain)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? .secondary : .accentColor)
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        .navigationTitle("Nextly")
        .frame(minWidth: 500, minHeight: 400)
    }
    
    private func addTask() {
        tasks.append(
            Task(id: UUID(),
                 title: "New Task",
                 isCompleted: false)
        )
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    TaskListView(
        title: "All Tasks",
        tasks: .constant(Task.examples())
    )
}
