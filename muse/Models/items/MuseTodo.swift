//
//  MuseTodo.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

class MuseTodo: MuseItem {
  var level: Int
  var dueTime: Date?
  
  private enum CodingKeys: String, CodingKey {
    case level
    case dueTime
  }
  
  override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(level, forKey: .level)
    try container.encode(dueTime, forKey: .dueTime)
  }
  
  init(summary: String, level: Int, duetime: Date?, customStamp: Date? = nil) {
    self.level = level
    self.dueTime = duetime
    
    super.init(summary: summary, customStamp: customStamp)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    level = try container.decode(Int.self, forKey: .level)
    dueTime = try container.decode(Date.self, forKey: .dueTime)
    
    try super.init(from: decoder)
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
