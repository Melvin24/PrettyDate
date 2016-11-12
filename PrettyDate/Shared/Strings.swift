//
//  Strings.swift
//  PrettyDate
//
//  Created by John, Melvin (Associate Software Developer) on 07/11/2016.
//  Copyright © 2016 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

class Strings {
    
    static func willOrDidUpdateNow() -> String {
        return NSLocalizedString("pretty-date.Now", comment: "Now")
    }
    
    static func didUpdateAboutAMinuteAgo() -> String {
        return NSLocalizedString("pretty-date.about a minute ago", comment: "about a minute ago")
    }
    
    static func willUpdateInAMinute() -> String {
        return NSLocalizedString("pretty-date.in a minute", comment: "in a minute")
    }
    
    static func willOrDidUpdateToday() -> String {
        return NSLocalizedString("pretty-date.Today", comment: "Today")
    }
    
    static func willUpdateTomorrow() -> String {
        return NSLocalizedString("pretty-date.Tomorrow", comment: "Tomorrow")
    }
    
    static func didUpdateYesterday() -> String {
        return NSLocalizedString("pretty-date.Yesterday", comment: "Yesterday")
    }
    
    static func relativeTimeStringError() -> String {
        return NSLocalizedString("pretty-date.Error", comment: "Error")
    }
    
    static func didUpdateAboutADayAgo() -> String {
        return NSLocalizedString("pretty-date.about-a-day-ago", comment: "")
    }
    
    static func willUpdateInADay() -> String {
        return NSLocalizedString("pretty-date.will-update-in-a-day", comment: "")
    }
    
    static func didUpdateAboutHalfAnHourAgo() -> String {
        return NSLocalizedString("pretty-date.about-half-an-hour-ago", comment: "")
    }
    
    static func willUpdateInHalfAnHour() -> String {
        return NSLocalizedString("pretty-date.will-update-in-half-an-hour", comment: "")
    }
    
    static func didUpdateAboutAnHourAgo() -> String {
        return NSLocalizedString("pretty-date.about-an-hour-ago", comment: "")
    }
    
    static func willUpdateInAnHour() -> String {
        return NSLocalizedString("pretty-date.will-update-in-an-hour", comment: "")
    }
    
    static func didUpdateMonthsAgo(months: Int) -> String {
        if months > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.months ago", comment: "months ago"), abs(months))
    }
    
    static func didUpdateMonthAgo(month: Int) -> String {
        if month > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.month ago", comment: "months ago"), abs(month))
    }
    
    static func willUpdateInMonths(months: Int) -> String {
        if months < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in months", comment: "months ago"), abs(months))
    }
    
    static func willUpdateInAMonth(month: Int) -> String {
        if month < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in month", comment: "months ago"), abs(month))
    }
    
    static func didUpdateMinutesAgo(minutes: Int) -> String {
        //not expecting a negative value
        if minutes > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.minutes ago", comment: "minutes ago"), abs(minutes))
    }
    
    static func didUpdateMinuteAgo(minute: Int) -> String {
        //not expecting a negative value
        if minute > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.minute ago", comment: "minute ago"), abs(minute))
    }
    
    static func willUpdateInMinutes(minutes: Int) -> String {
        //not expecting a positive value
        if minutes < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in minutes", comment: "in minutes"), abs(minutes))
    }
    
    static func willUpdateInMinute(minute: Int) -> String {
        //not expecting a positive value
        if minute < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in minute", comment: "in minute"), abs(minute))
    }
    
    static func didUpdateHoursAgo(hours: Int) -> String {
        //not expecting a negative value
        if hours > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.hours ago", comment: "hours ago"), abs(hours))
    }
    
    static func didUpdateHourAgo(hour: Int) -> String {
        //not expecting a negative value
        if hour > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.hour ago", comment: "hour ago"), abs(hour))
    }
    
    static func willUpdateInHours(hours: Int) -> String {
        //not expecting a positive value
        if hours < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in hours", comment: "hours"), abs(hours))
    }
    
    static func willUpdateInHour(hour: Int) -> String {
        //not expecting a positive value
        if hour < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in hour", comment: "hour"), abs(hour))
    }
    
    static func willUpdateInDays(days: Int) -> String {
        //not expecting a positive value
        if days < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in days", comment: "days"), abs(days))
    }
    
    static func didUpdateDaysAgo(days: Int) -> String {
        //not expecting a negative value
        if days > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.days ago", comment: "days ago"), abs(days))
    }
    
    static func didUpdateWeeksAgo(weeks: Int) -> String {
        //not expecting a negative value
        if weeks > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.weeks ago", comment: "weeks ago"), abs(weeks))
    }
    
    static func didUpdateWeekAgo(week: Int) -> String {
        //not expecting a negative value
        if week > 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.week ago", comment: "week ago"), abs(week))
    }
    
    static func willUpdateInWeek(week: Int) -> String {
        //not expecting a positive value
        if week < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in week", comment: "week"), abs(week))
    }
    
    static func willUpdateInWeeks(weeks: Int) -> String {
        //not expecting a positive value
        if weeks < 0 {
            return Strings.relativeTimeStringError()
        }
        return String.localizedStringWithFormat(NSLocalizedString("pretty-date.in weeks", comment: "weeks"), abs(weeks))
    }
    
    static func willOrDidUpdateOn() -> String {
        return NSLocalizedString("pretty-date.on", comment: "on")
    }
    
}
