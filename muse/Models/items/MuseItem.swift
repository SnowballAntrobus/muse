//
//  MuseItem.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

struct MuseItem: Identifiable, Codable {
  var id: UUID
  var dtStamp: Date
  var summary: String
  
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
