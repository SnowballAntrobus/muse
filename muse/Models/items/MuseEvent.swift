//
//  MuseEvent.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

class MuseEvent: MuseItem {
  var startTime: Date
  var endTime: Date
  
  private enum MuseEventError: Error {
    case invalidTime
  }
  
  private enum CodingKeys: String, CodingKey {
    case startTime
    case endTime
  }
  
  override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
    
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(startTime, forKey: .startTime)
    try container.encode(endTime, forKey: .endTime)
  }
  
  init(summary: String, starttime: Date, endtime: Date, customStamp: Date? = nil) throws {
    guard starttime < endtime else {
      throw MuseEventError.invalidTime
    }
    
    self.startTime = starttime
    self.endTime = endtime
    
    super.init(summary: summary, customStamp: customStamp)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    startTime = try container.decode(Date.self, forKey: .startTime)
    endTime = try container.decode(Date.self, forKey: .endTime)
    
    try super.init(from: decoder)
  }
}

extension MuseEvent {
  static var data: [MuseEvent] {
    [
      (try? MuseEvent(summary: "event test 1",
                starttime: Date(timeIntervalSinceNow: 864000),
                endtime: Date(timeIntervalSinceNow: 864000+3600)))!,
      (try? MuseEvent(summary: "event test 2",
                starttime: Date(timeIntervalSinceNow: 864000+3600),
                endtime: Date(timeIntervalSinceNow: 864000+3600*2)))!,
      (try? MuseEvent(summary: "event test 3",
                starttime: Date(timeIntervalSinceNow: 864000*3),
                endtime: Date(timeIntervalSinceNow: 864000*3+3600)))!,
      (try? MuseEvent(summary: "event test 4",
                starttime: Date(timeIntervalSinceNow: 864000*7),
                endtime: Date(timeIntervalSinceNow: 864000*7+3600)))!
    ]
  }
}
