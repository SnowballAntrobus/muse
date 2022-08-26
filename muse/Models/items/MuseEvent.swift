//
//  MuseEvent.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

class MuseEvent: MuseItem {
  var startDateTime: Date
  var endDateTime: Date
  
  enum MuseEventError: Error {
    case invalidDateTime
  }
  
  private enum CodingKeys: String, CodingKey {
    case startDateTime
    case endDateTime
  }
  
  override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(startDateTime, forKey: .startDateTime)
    try container.encode(endDateTime, forKey: .endDateTime)
  }
  
  init(summary: String, startDateTime: Date, endDateTime: Date, customStamp: Date? = nil) throws {
    guard startDateTime < endDateTime else {
      throw MuseEventError.invalidDateTime
    }
    
    self.startDateTime = startDateTime
    self.endDateTime = endDateTime
    
    super.init(summary: summary, customStamp: customStamp)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    startDateTime = try container.decode(Date.self, forKey: .startDateTime)
    endDateTime = try container.decode(Date.self, forKey: .endDateTime)
    
    try super.init(from: decoder)
  }
}

extension MuseEvent {
  static var data: [MuseEvent] {
    [
      (try? MuseEvent(summary: "event test 1",
                startDateTime: Date(timeIntervalSinceNow: 864000),
                endDateTime: Date(timeIntervalSinceNow: 864000+3600)))!,
      (try? MuseEvent(summary: "event test 2",
                startDateTime: Date(timeIntervalSinceNow: 864000+3600),
                endDateTime: Date(timeIntervalSinceNow: 864000+3600*2)))!,
      (try? MuseEvent(summary: "event test 3",
                startDateTime: Date(timeIntervalSinceNow: 864000*3),
                endDateTime: Date(timeIntervalSinceNow: 864000*3+3600)))!,
      (try? MuseEvent(summary: "event test 4",
                startDateTime: Date(timeIntervalSinceNow: 864000*7),
                endDateTime: Date(timeIntervalSinceNow: 864000*7+3600)))!
    ]
  }
}

extension MuseEvent {
  struct Datas {
    var summary: String = ""
    var startDateTime: Date = Date()
    var endDateTime: Date = Date()
  }
  
  var data: Datas {
    return Datas(summary: summary, startDateTime: startDateTime, endDateTime: endDateTime)
  }
  
  func update(from data: Datas) throws {
    print("cool")
    guard startDateTime < endDateTime else {
      throw MuseEventError.invalidDateTime
    }
    
    summary = data.summary
    startDateTime = data.startDateTime
    endDateTime = data.endDateTime
  }
}
