//
//  ToDoModel.swift
//  RealmTodoApp
//
//  Created by Jacob Tamayo on 7/28/22.
//

import Foundation
import RealmSwift

class ToDoModel: Object, ObjectKeyIdentifiable {
  /// Create a Primary Key
  @Persisted(primaryKey: true) var id: ObjectId
  
  // Use @Persisted property wrapper to have the data managed by Realm
  // Making a property as Persisted will guarantee a default value
  @Persisted var name: String
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
  }
  
  // Create a convenience init
  convenience init(name: String) {
    self.init()
    self.name = name
  }
}
