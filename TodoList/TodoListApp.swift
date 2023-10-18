//
//  TodoListApp.swift
//  TodoList
//
//  Created by ramia n on 27/02/1445 AH.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
