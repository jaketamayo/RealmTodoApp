//
//  ToDoListRow.swift
//  RealmTodoApp
//
//  Created by Jacob Tamayo on 7/29/22.
//

import SwiftUI
import RealmSwift

struct ToDoListRow: View {
  @ObservedRealmObject var toDo: ToDoModel
    var body: some View {
      HStack {
        Button {
          $toDo.completed.wrappedValue.toggle()
        } label: {
          Image(systemName: toDo.completed ? "checkmark.circle" : "circle")
        }
        // This prevents the entire row from being selected when you tap on the circle button
        .buttonStyle(.plain)
        TextField("Todo List", text: $toDo.name)
        Spacer()
        Button {
          $toDo.urgancy.wrappedValue = toDo.cycleUrgency()
        }label: {
          Text(toDo.urgancy.text)
            .padding(5)
            .frame(width: 80)
            .foregroundColor(Color(.systemBackground))
            .background(RoundedRectangle(cornerRadius: 10).fill(toDo.urgancy.color))
        }
        .buttonStyle(.plain)
      }
      .padding()
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var previews: some View {
      ToDoListRow(toDo: ToDoModel(name: "Make list"))
    }
}
