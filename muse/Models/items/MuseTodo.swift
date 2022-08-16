//
//  MuseTodo.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

struct MuseTodo: Codable {
  var museItem: MuseItem
  var level: Int
  var dueTime: Date?
  
  init(summary: String, level: Int, duetime: Date?, customStamp: Date? = nil) {
    self.museItem = MuseItem(summary: summary, customStamp: customStamp)
    
    self.level = level
    
    self.dueTime = duetime
  }
}

extension MuseTodo {
  static var data: [MuseTodo] {
    [
      MuseTodo(summary: "todo test 1", level: 0, duetime: Date(timeIntervalSinceNow: 864000)),
      MuseTodo(summary: "todo test 2", level: 1, duetime: Date(timeIntervalSinceNow: 864000)),
      MuseTodo(summary: "todo test 3", level: 1, duetime: Date(timeIntervalSinceNow: 864000+3600)),
      MuseTodo(summary: "todo test 1", level: 2, duetime: nil)
    ]
  }
}
