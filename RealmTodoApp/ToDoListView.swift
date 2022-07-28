//
//  ContentView.swift
//  RealmTodoApp
//
//  Created by Jacob Tamayo on 7/28/22.
//

import SwiftUI
import RealmSwift

struct ToDoListView: View {
  @ObservedResults(ToDoModel.self) var toDos
  // Create a varible to add todos
  @State private var add = ""
    var body: some View {
      NavigationView {
        VStack {
          HStack {
            TextField("Add new todo", text: $add)
              .textFieldStyle(.roundedBorder)
            Spacer()
            Button {
              let newToDo = ToDoModel(name: add)
              $toDos.append(newToDo)
              add = ""
            } label: {
              Image(systemName: "plus.circle.fill")
            }
            // Dont let todo be added if text field is empty
            .disabled(add.isEmpty)
          }
          List {
            ForEach(toDos) { toDo in
              Text(toDo.name)
            }
          }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
