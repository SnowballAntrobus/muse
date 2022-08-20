//
//  MuseItem.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

class MuseItem: Identifiable, Codable {
  var id: UUID
  var dtStamp: Date
  var summary: String
  
  private enum CodingKeys: String, CodingKey {
    case id
    case dtStamp
    case summary
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(dtStamp, forKey: .dtStamp)
    try container.encode(summary, forKey: .summary)
  }
  
  init(summary: String, customStamp: Date? = nil) {
    self.id = UUID()
    
    if let customStamp = customStamp {
      self.dtStamp = customStamp
    } else {
      self.dtStamp = Date()
    }
    
    self.summary = summary
  }
}
