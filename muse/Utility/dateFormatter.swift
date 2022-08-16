//
//  dateFormatter.swift
//  muse
//
//  Created by Dante Gil-Marin on 8/16/22.
//

import Foundation

func dateFormatter(year: Int, month: Int, day: Int, hour: Int, minute: Int, timeZone: String) -> Date? {
  var dateComponents = DateComponents()
  dateComponents.year = year
  dateComponents.month = month
  dateComponents.day = day
  dateComponents.hour = hour
  dateComponents.minute = minute
  dateComponents.timeZone = TimeZone(abbreviation: timeZone)
  
  let userCalendar = Calendar(identifier: .gregorian)
  return userCalendar.date(from: dateComponents)
}
