//
//  RealmTodoAppApp.swift
//  RealmTodoApp
//
//  Created by Jacob Tamayo on 7/28/22.
//

import SwiftUI

@main
struct RealmTodoAppApp: App {
  var body: some Scene {
    WindowGroup {
      ToDoListView()
      // Print out documents directory to view location of Realm database file
        .onAppear {
          print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        }
    }
  }
}
