//
//  Date+Prettify.swift
//  SkySports
//
//  Created by John, Melvin (Associate Software Developer) on 29/10/2016.
//  Copyright © 2016 Sky UK. All rights reserved.
//

import Foundation

extension Date {
    
    /**
     A Simple method that returns a relative date string
     
     - Example - if you do self.relativeTimeStringFromCurrentDate() for a date that is 5 minutes before the Current Date, it will return '5 minutes ago'
     
     - if an error occures the localised string 'pretty-date.Error' string is returned
     
     - parameter nil
     
     - Returns: NSString Pretty Date.
     */
    func relativeTimeStringFromCurrentDate() -> String {
        return Date().relativeStringFromDate(date: self)
    }
    
    /**
     A Simple method that returns a relative date string for a given date
     
     - Example - if you pass a date which is 5 minutes after the self(Date) then is will return 'in 5 minutes'
     
     - if an error occures the localised string 'pretty-date.Error' string is returned
     
     - parameter NSDate, a Date.
     
     - Returns: NSString Pretty Date.
     */
    func relativeTimeStringFromDate(date: Date) -> String {
        return self.relativeStringFromDate(date: date)
    }

    static func stringForTimeInterval(timeInterval: TimeInterval) -> String? {
        print(round(timeInterval))
        print(Date().timeIntervalSince1970)
        return Date().relativeStringFromDate(date: Date(timeIntervalSince1970: timeInterval))
    }
    
    private func relativeStringFromDate(date: Date) -> String {
        
        let calenderComponent = Calendar.current.dateComponents(Set(arrayLiteral: .day, .hour, .minute, .second), from: self, to: date)
        
        guard let numberOfSeconds = calenderComponent.second,
              let numberOfMinutes = calenderComponent.minute,
              let numberOfHours   = calenderComponent.hour,
              let numberOfDay     = calenderComponent.day else {
            return relativeTimeStringError()
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
            return willOrDidUpdateNow()
        } else {
            return relativeTimeStringError()
        }
        
    }
    
    private func constructMonths(withMonths months: Int) -> String {
        switch months {
        case -4...4:
            guard months > 0 else {
                return months == -1 ? self.didUpdateMonthAgo(month: months) : self.didUpdateMonthsAgo(months: months)
            }
            return months == 1 ? self.willUpdateInAMonth(month: months) : self.willUpdateInMonths(months: months)
        default:
            return constructDateFromMonths(withMonths: months)
        }
    }
    
    private func constructWeeks(withWeeks weeks: Int) -> String {
        switch weeks {
            case -4...4:
                guard weeks > 0 else {
                    return weeks == -1 ? self.didUpdateWeekAgo(week: weeks) : self.didUpdateWeeksAgo(weeks: weeks)
                }
                return weeks == 1 ? self.willUpdateInWeek(week: weeks) : self.willUpdateInWeeks(weeks: weeks)
            default:
                let weeksInDouble = Double(weeks)
                return constructMonths(withMonths: Int(round(weeksInDouble * 0.230137)))
        }
    }
    
    private func constructDateFromMonths(withMonths months: Int) -> String {
        let prefixVocabulary = self.willOrDidUpdateOn()
        var expectedDatecomponents = DateComponents()
        expectedDatecomponents.month = months
        let expectedDateFromDateComponent = self.constructExpectedDateFromDateComponent(dateComponent: expectedDatecomponents)
        
        return "\(prefixVocabulary) \(expectedDateFromDateComponent)"
    }
    
    private func constructExpectedDateFromDateComponent(dateComponent: DateComponents) -> String {
        let calendar = Calendar.current
        guard let expectedDate = calendar.date(byAdding: dateComponent, to: self) else {
            return self.relativeTimeStringError()
        }
        return DateFormatter.localizedString(from: expectedDate, dateStyle: .medium, timeStyle: .none)
    }
    
    private func constructSeconds(withSeconds seconds: Int) -> String {
        switch seconds {
        case -30...30:
            return self.willOrDidUpdateNow()
        case 30...60:
            return self.willUpdateInAMinute()
        case -60 ... -30:
            return self.didUpdateAboutAMinuteAgo()
        default:
            let secondsAsDouble = Double(seconds)
            return constructMinutes(withMinutes: Int(round(secondsAsDouble/60)))
        }
    }
    
    private func constructMinutes(withMinutes minutes: Int) -> String {
        switch minutes {
        case -25...25:
            guard minutes > 0 else {
                return minutes == -1 ? self.didUpdateMinuteAgo(minute: minutes) : self.didUpdateMinutesAgo(minutes: minutes)
            }
            return minutes == 1 ? self.willUpdateInMinute(minute: minutes) : self.willUpdateInMinutes(minutes: minutes)
        case -45...45:
            guard minutes > 0 else {
                return didUpdateAboutHalfAnHourAgo()
            }
            return willUpdateInHalfAnHour()
        case -60...60:
            guard minutes > 0 else {
                return didUpdateAboutAnHourAgo()
            }
            return willUpdateInAnHour()
        default:
            let minutesAsDouble = Double(minutes)
            return constructHours(withHours: Int(round(minutesAsDouble/60)))
        }
        
    }
    
    private func constructHours(withHours hours: Int) -> String {
        switch hours {
        case -22...22:
            guard hours > 0 else {
                return hours == -1 ? self.didUpdateHourAgo(hour: hours) : self.didUpdateHoursAgo(hours: hours)
            }
            return hours == 1 ? self.willUpdateInHour(hour: hours) :self.willUpdateInHours(hours: hours)
        case -24...24:
            guard hours > 0 else {
                return didUpdateAboutADayAgo()
            }
            return willUpdateInADay()
        default:
            let hoursAsDouble = Double(hours)
            return constructDays(withDays: Int(round(hoursAsDouble/24)))
        }
    }
    
    private func constructDays(withDays days: Int) -> String {
        switch days {
        case -6 ... 6:
            if days == 1 {
                return self.willUpdateTomorrow()
            } else if days > 1 {
                return self.willUpdateInDays(days: days)
            } else if days == -1 {
                return self.didUpdateYesterday()
            } else {
                return self.didUpdateDaysAgo(days: days)
            }
        default:
            let daysAsDouble = Double(days)
            return constructWeeks(withWeeks: Int(round(daysAsDouble/7.0)))
        }
    }
    
    private func willOrDidUpdateNow() -> String {
        return NSLocalizedString("pretty-date.Now", comment: "Now")
    }
    
    private func didUpdateAboutAMinuteAgo() -> String {
        return NSLocalizedString("pretty-date.about a minute ago", comment: "about a minute ago")
    }
    
    private func willUpdateInAMinute() -> String {
        return NSLocalizedString("pretty-date.in a minute", comment: "in a minute")
    }
    
    private func willOrDidUpdateToday() -> String {
        return NSLocalizedString("pretty-date.Today", comment: "Today")
    }
    
    private func willUpdateTomorrow() -> String {
        return NSLocalizedString("pretty-date.Tomorrow", comment: "Tomorrow")
    }
    
    private func didUpdateYesterday() -> String {
        return NSLocalizedString("pretty-date.Yesterday", comment: "Yesterday")
    }
    
    private func relativeTimeStringError() -> String {
        return NSLocalizedString("pretty-date.Error", comment: "Error")
    }
    
    private func timeIntervalfromDate(date: Date) -> TimeInterval {
        return round(self.timeIntervalSince(date))
    }
    
    private func didUpdateAboutADayAgo() -> String {
        return NSLocalizedString("pretty-date.about-a-day-ago", comment: "")
    }
    
    private func willUpdateInADay() -> String {
        return NSLocalizedString("pretty-date.will-update-in-a-day", comment: "")
    }
    
    private func didUpdateAboutHalfAnHourAgo() -> String {
        return NSLocalizedString("pretty-date.about-half-an-hour-ago", comment: "")
    }
    
    private func willUpdateInHalfAnHour() -> String {
        return NSLocalizedString("pretty-date.will-update-in-half-an-hour", comment: "")
    }
    
    private func didUpdateAboutAnHourAgo() -> String {
        return NSLocalizedString("pretty-date.about-an-hour-ago", comment: "")
    }
    
    private func willUpdateInAnHour() -> String {
        return NSLocalizedString("pretty-date.will-update-in-an-hour", comment: "")
    }
    
    private func didUpdateMonthsAgo(months: Int) -> String {
        if months > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.months ago", comment: "months ago"), abs(months))
    }
    
    private func didUpdateMonthAgo(month: Int) -> String {
        if month > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.month ago", comment: "months ago"), abs(month))
    }
    
    private func willUpdateInMonths(months: Int) -> String {
        if months < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in months", comment: "months ago"), abs(months))
    }
    
    private func willUpdateInAMonth(month: Int) -> String {
        if month < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in month", comment: "months ago"), abs(month))
    }
    
    private func didUpdateMinutesAgo(minutes: Int) -> String {
        //not expecting a negative value
        if minutes > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.minutes ago", comment: "minutes ago"), abs(minutes))
    }
    
    private func didUpdateMinuteAgo(minute: Int) -> String {
        //not expecting a negative value
        if minute > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.minute ago", comment: "minute ago"), abs(minute))
    }
    
    private func willUpdateInMinutes(minutes: Int) -> String {
        //not expecting a positive value
        if minutes < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in minutes", comment: "in minutes"), abs(minutes))
    }
    
    private func willUpdateInMinute(minute: Int) -> String {
        //not expecting a positive value
        if minute < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in minute", comment: "in minute"), abs(minute))
    }
    
    private func didUpdateHoursAgo(hours: Int) -> String {
        //not expecting a negative value
        if hours > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.hours ago", comment: "hours ago"), abs(hours))
    }
    
    private func didUpdateHourAgo(hour: Int) -> String {
        //not expecting a negative value
        if hour > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.hour ago", comment: "hour ago"), abs(hour))
    }
    
    private func willUpdateInHours(hours: Int) -> String {
        //not expecting a positive value
        if hours < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in hours", comment: "hours"), abs(hours))
    }
    
    private func willUpdateInHour(hour: Int) -> String {
        //not expecting a positive value
        if hour < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in hour", comment: "hour"), abs(hour))
    }
    
    private func willUpdateInDays(days: Int) -> String {
        //not expecting a positive value
        if days < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in days", comment: "days"), abs(days))
    }
    
    private func didUpdateDaysAgo(days: Int) -> String {
        //not expecting a negative value
        if days > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.days ago", comment: "days ago"), abs(days))
    }
    
    private func didUpdateWeeksAgo(weeks: Int) -> String {
        //not expecting a negative value
        if weeks > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.weeks ago", comment: "weeks ago"), abs(weeks))
    }
    
    private func didUpdateWeekAgo(week: Int) -> String {
        //not expecting a negative value
        if week > 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.week ago", comment: "week ago"), abs(week))
    }
    
    private func willUpdateInWeek(week: Int) -> String {
        //not expecting a positive value
        if week < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in week", comment: "week"), abs(week))
    }
    
    private func willUpdateInWeeks(weeks: Int) -> String {
        //not expecting a positive value
        if weeks < 0 {
            return self.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in weeks", comment: "weeks"), abs(weeks))
    }
    
    private func willOrDidUpdateOn() -> String {
        return NSLocalizedString("pretty-date.on", comment: "on")
    }
    
    //Zero Seconds
    private func zeroSeconds() -> TimeInterval {
        return 0
    }
    
    //Seconds in Half a minute
    private func halfAMinute() -> TimeInterval {
        return 30
    }
    
    //Seconds in a Minute
    private func aMinute() -> TimeInterval {
        return 60
    }
    
    //Seconds in an Hour
    private func anHour() -> TimeInterval {
        return 3600
    }
    
    //Seconds in a Day
    private func aDay() -> TimeInterval {
        return 86400
    }
    
}
