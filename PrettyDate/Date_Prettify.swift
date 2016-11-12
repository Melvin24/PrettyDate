//
//  Date+Prettify.swift
//  SkySports
//
//  Created by John, Melvin (Associate Software Developer) on 29/10/2016.
//  Copyright © 2016 Sky UK. All rights reserved.
//

import Foundation

class PrettyDate {
    
    var usesIdiomaticDeicticExpressions = false
    
    /**
     A Simple method that returns a relative date string
     
     - Example - if you do PrettyDate.stringForTimeInterval(from: Date, to: Date) with a from date that is 5 minutes before the to Date, it will return '5 minutes ago'
     
     - if an error occures the localised string 'pretty-date.Error' string is returned
     
     - parameter startingDate: Starting Date
     - parameter endingDate: Ending Date

     - Returns: String Pretty Date
     */
    static func stringForTimeInterval(from startingDate: Date, to endingDate: Date) -> String {
        let prettyDate = PrettyDate()
        return prettyDate.stringForTimeInterval(from: startingDate, to: endingDate)
    }
    
    /**
     A Simple method that returns a relative date string for a given date
     
     - Example - if you pass a timeinterval which is 5 minutes ahead of the current Date Time then it will return 'in 5 minutes'
     
     - if an error occures the localised string 'pretty-date.Error' string is returned
     
     - parameter timeInterval: The number of seconds to add to current Date Time. Use a negative value for seconds to have the returned object specify a pretty date before the receiver.
     
     - Returns: String Pretty Date
     */
    static func stringForTimeInterval(timeInterval: TimeInterval) -> String {
        let prettyDate = PrettyDate()
        return prettyDate.stringForTimeInterval(timeInterval: timeInterval)
    }
    
    /**
     A Simple method that returns a relative date string
     
     - Example - if you do PrettyDate.stringForTimeInterval(from: Date, to: Date) with a from date that is 5 minutes before the to Date, it will return '5 minutes ago'
     
     - if an error occures the localised string 'pretty-date.Error' string is returned
     
     - parameter startingDate: Starting Date
     - parameter endingDate: Ending Date
     
     - Returns: String Pretty Date
     */
    func stringForTimeInterval(from startingDate: Date, to endingDate: Date) -> String {
        return startingDate.relativeStringFromDate(date: endingDate)
    }
    
    /**
     A Simple method that returns a relative date string for a given date
     
     - Example - if you pass a timeinterval which is 5 minutes ahead of the current Date Time then it will return 'in 5 minutes'
     
     - if an error occures the localised string 'pretty-date.Error' string is returned
     
     - parameter timeInterval: The number of seconds to add to current Date Time. Use a negative value for seconds to have the returned object specify a pretty date before the receiver.
     
     - Returns: String Pretty Date
     */
    func stringForTimeInterval(timeInterval: TimeInterval) -> String {
        return Date().relativeStringFromDate(date: Date(timeIntervalSince1970: timeInterval))
    }
}

fileprivate extension Date {
    
    func relativeTimeStringFromCurrentDate() -> String {
        return Date().relativeStringFromDate(date: self)
    }
    
    func relativeStringFromDate(date: Date) -> String {
        
        let calenderComponent = Calendar.current.dateComponents(Set(arrayLiteral: .day, .hour, .minute, .second), from: self, to: date)
        
        guard let numberOfSeconds = calenderComponent.second,
              let numberOfMinutes = calenderComponent.minute,
              let numberOfHours   = calenderComponent.hour,
              let numberOfDay     = calenderComponent.day else {
            return Strings.relativeTimeStringError()
        }
        
        if numberOfDay != 0 {
            return constructDays(withDays: numberOfDay)
        } else if numberOfHours != 0 {
            return constructHours(withHours: numberOfHours)
        } else if numberOfMinutes != 0 {
            return constructMinutes(withMinutes: numberOfMinutes)
        } else if numberOfSeconds != 0 {
            return constructSeconds(withSeconds: numberOfSeconds)
        } else if numberOfSeconds == 0 {
            return Strings.willOrDidUpdateNow()
        } else {
            return Strings.relativeTimeStringError()
        }
        
    }
    
    func constructMonths(withMonths months: Int) -> String {
        switch months {
        case -4...4:
            guard months > 0 else {
                return months == -1 ? Strings.didUpdateMonthAgo(month: months) : Strings.didUpdateMonthsAgo(months: months)
            }
            return months == 1 ? Strings.willUpdateInAMonth(month: months) : Strings.willUpdateInMonths(months: months)
        default:
            return constructDateFromMonths(withMonths: months)
        }
    }
    
    func constructWeeks(withWeeks weeks: Int) -> String {
        switch weeks {
            case -4...4:
                guard weeks > 0 else {
                    return weeks == -1 ? Strings.didUpdateWeekAgo(week: weeks) : Strings.didUpdateWeeksAgo(weeks: weeks)
                }
                return weeks == 1 ? Strings.willUpdateInWeek(week: weeks) : Strings.willUpdateInWeeks(weeks: weeks)
            default:
                let weeksInDouble = Double(weeks)
                return constructMonths(withMonths: Int(round(weeksInDouble * 0.230137)))
        }
    }
    
    func constructDateFromMonths(withMonths months: Int) -> String {
        let prefixVocabulary = Strings.willOrDidUpdateOn()
        var expectedDatecomponents = DateComponents()
        expectedDatecomponents.month = months
        let expectedDateFromDateComponent = self.constructExpectedDateFromDateComponent(dateComponent: expectedDatecomponents)
        
        return "\(prefixVocabulary) \(expectedDateFromDateComponent)"
    }
    
    func constructExpectedDateFromDateComponent(dateComponent: DateComponents) -> String {
        let calendar = Calendar.current
        guard let expectedDate = calendar.date(byAdding: dateComponent, to: self) else {
            return Strings.relativeTimeStringError()
        }
        return DateFormatter.localizedString(from: expectedDate, dateStyle: .medium, timeStyle: .none)
    }
    
    func constructSeconds(withSeconds seconds: Int) -> String {
        switch seconds {
        case -30...30:
            return Strings.willOrDidUpdateNow()
        case 30...60:
            return Strings.willUpdateInAMinute()
        case -60 ... -30:
            return Strings.didUpdateAboutAMinuteAgo()
        default:
            let secondsAsDouble = Double(seconds)
            return constructMinutes(withMinutes: Int(round(secondsAsDouble/60)))
        }
    }
    
    func constructMinutes(withMinutes minutes: Int) -> String {
        switch minutes {
        case -25...25:
            guard minutes > 0 else {
                return minutes == -1 ? Strings.didUpdateMinuteAgo(minute: minutes) : Strings.didUpdateMinutesAgo(minutes: minutes)
            }
            return minutes == 1 ? Strings.willUpdateInMinute(minute: minutes) : Strings.willUpdateInMinutes(minutes: minutes)
        case -45...45:
            guard minutes > 0 else {
                return Strings.didUpdateAboutHalfAnHourAgo()
            }
            return Strings.willUpdateInHalfAnHour()
        case -60...60:
            guard minutes > 0 else {
                return Strings.didUpdateAboutAnHourAgo()
            }
            return Strings.willUpdateInAnHour()
        default:
            let minutesAsDouble = Double(minutes)
            return constructHours(withHours: Int(round(minutesAsDouble/60)))
        }
        
    }
    
    func constructHours(withHours hours: Int) -> String {
        switch hours {
        case -22...22:
            guard hours > 0 else {
                return hours == -1 ? Strings.didUpdateHourAgo(hour: hours) : Strings.didUpdateHoursAgo(hours: hours)
            }
            return hours == 1 ? Strings.willUpdateInHour(hour: hours) :Strings.willUpdateInHours(hours: hours)
        case -24...24:
            guard hours > 0 else {
                return Strings.didUpdateAboutADayAgo()
            }
            return Strings.willUpdateInADay()
        default:
            let hoursAsDouble = Double(hours)
            return constructDays(withDays: Int(round(hoursAsDouble/24)))
        }
    }
    
    func constructDays(withDays days: Int) -> String {
        switch days {
        case -6 ... 6:
            if days == 1 {
                return Strings.willUpdateTomorrow()
            } else if days > 1 {
                return Strings.willUpdateInDays(days: days)
            } else if days == -1 {
                return Strings.didUpdateYesterday()
            } else {
                return Strings.didUpdateDaysAgo(days: days)
            }
        default:
            let daysAsDouble = Double(days)
            return constructWeeks(withWeeks: Int(round(daysAsDouble/7.0)))
        }
    }
    
}
