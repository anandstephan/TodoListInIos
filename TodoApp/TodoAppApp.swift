//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Anand Stephan on 10/03/24.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
               ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
