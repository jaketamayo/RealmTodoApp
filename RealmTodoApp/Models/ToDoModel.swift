//
//  ToDoModel.swift
//  RealmTodoApp
//
//  Created by Jacob Tamayo on 7/28/22.
//

import SwiftUI
import RealmSwift

class ToDoModel: Object, ObjectKeyIdentifiable {
  
  // Create a Primary Key
  @Persisted(primaryKey: true) var id: ObjectId
  
  // Use @Persisted property wrapper to have the data managed by Realm
  // Making a property as Persisted will guarantee a default value
  @Persisted var name: String
  
  // This will be used for the checkmark when completing a task
  @Persisted var completed: Bool = false
  @Persisted var urgancy: Urgency = .nuetral
  
  //Urgency is Int so it can be sorted easily based on importance
  enum Urgency: Int, PersistableEnum{
    
    case trivial, nuetral, urgent
    
    var text: String {
      switch self {
        case .trivial:
          return "Trivial"
        case .nuetral:
          return "Nuetral"
        case .urgent:
          return "Urgent"
      }
    }
    
    var color: Color {
      switch self {
        case .trivial:
          return .gray
        case .nuetral:
          return .yellow
        case .urgent:
          return .red
      }
    }
  }
  
  // Function that will cycle through the Urgency options
  func cycleUrgency() -> Urgency {
    switch urgancy {
      case .trivial:
        return .nuetral
      case .nuetral:
        return .urgent
      case .urgent:
        return .trivial
    }
  }
  
  // Create a convenience init
  convenience init(name: String) {
    self.init()
    self.name = name
  }
}
