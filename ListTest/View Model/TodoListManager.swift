//
//  TodoListManager.swift
//  ListTest
//
//  Created by Amby on 09/10/2022.
//

import Foundation

class TodoListManager: ObservableObject {
    @Published var items: [Item] = [
        Item(id: UUID(), name: "first"),
        Item(id: UUID(), name: "second")
    ]
    init() {
        //get my data and sen
    }

    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }

    func addItem() {
        items.append(Item(id: UUID(), name: "newly added"))
    }

    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
}
