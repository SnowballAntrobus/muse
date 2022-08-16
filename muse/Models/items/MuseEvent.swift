//
//  MuseEvent.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

struct MuseEvent: Codable {
  var museItem: MuseItem
  var startTime: Date
  var endTime: Date
  
  init(summary: String, starttime: Date, endtime: Date, customStamp: Date? = nil) throws {
    guard starttime < endtime else {
      throw MuseEventError.invalidTime
    }
    
    self.museItem = MuseItem(summary: summary, customStamp: customStamp)
    
    self.startTime = starttime
    
    self.endTime = endtime
  }
}

enum MuseEventError: Error {
  case invalidTime
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
