//
//  ContentView.swift
//  ListTest
//
//  Created by Amby on 09/10/2022.
//

import SwiftUI


struct TodoListView: View {

    @ObservedObject var todoListManager = TodoListManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(todoListManager.items) { item in
                    NavigationLink(destination: Text("Destination \(item.name)"), label: {
                        Text(item.name)
                    })
                }
                .onDelete(perform: { indexSet in
                    todoListManager.delete(at: indexSet)
                })
                .onMove(perform: {indices, newOffset in
                    todoListManager.move(indices: indices, newOffset: newOffset)
                })
            }
            .navigationBarTitle(Text("Todo's"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()

                    Button(action: {
                        todoListManager.addItem()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoListManager: TodoListManager())
    }
}
