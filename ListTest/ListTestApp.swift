//
//  ListTestApp.swift
//  ListTest
//
//  Created by Amby on 09/10/2022.
//

import SwiftUI

@main
struct ListTestApp: App {
    @StateObject var todoListManager = TodoListManager()
    var body: some Scene {
        WindowGroup {
            TodoListView(todoListManager: todoListManager)
        }
    }
}
