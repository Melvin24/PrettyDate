//
//  PrettyDateTests.swift
//  PrettyDateTests
//
//  Created by John, Melvin (Associate Software Developer) on 01/11/2016.
//  Copyright © 2016 John, Melvin (Associate Software Developer). All rights reserved.
//

import XCTest
@testable import PrettyDate
@testable import FormatterKit

class PrettyDateTests: XCTestCase {
  
    func testPrettifyTimeIntervalWithZeroSecondsLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 0))
        XCTAssertEqual(prettyString, "Now")
    }
    
    func testPrettifyTimeIntervalWithTwentySecondsLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 20))
        XCTAssertEqual(prettyString, "Now")
    }
    
    func testPrettifyTimeIntervalWithTwentySecondsLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -20))
        XCTAssertEqual(prettyString, "Now")
    }
    
    func testPrettifyTimeIntervalWithThirtySecondsLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 30))
        XCTAssertEqual(prettyString, "Now")
    }
    
    func testPrettifyTimeIntervalWithThirtySecondsLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -30))
        XCTAssertEqual(prettyString, "Now")
    }
    
    func testPrettifyTimeIntervalWithThirtyOneSecondsLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 31.5))
        XCTAssertEqual(prettyString, "in a minute")
    }
    
    func testPrettifyTimeIntervalWithThirtyOneSecondsLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -31.5))
        XCTAssertEqual(prettyString, "about a minute ago")
    }
    
    func testPrettifyTimeIntervalWithAlmostAMinuteLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 59.5))
        XCTAssertEqual(prettyString, "in a minute")
    }
    
    func testPrettifyTimeIntervalWithAlmostAMinuteLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -59.5))
        XCTAssertEqual(prettyString, "about a minute ago")
    }
    
    func testPrettifyTimeIntervalWithAMinuteLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 60.5))
        XCTAssertEqual(prettyString, "in 1 minute")
    }
    
    func testPrettifyTimeIntervalWithAMinuteLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -60.5))
        XCTAssertEqual(prettyString, "1 minute ago")
    }
    
    func testPrettifyTimeIntervalWithAMinuteAndHalfLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 90.5))
        XCTAssertEqual(prettyString, "in 1 minute")
    }
    
    func testPrettifyTimeIntervalWithAMinuteAndHalfLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -90.5))
        XCTAssertEqual(prettyString, "1 minute ago")
    }
    
    func testPrettifyTimeIntervalWithTwoMinuteLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 120.5))
        XCTAssertEqual(prettyString, "in 2 minutes")
    }
    
    func testPrettifyTimeIntervalWithTwoMinuteLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -120.5))
        XCTAssertEqual(prettyString, "2 minutes ago")
    }
    
    func testPrettifyTimeIntervalWithThirtyMinuteLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 1800.5))
        XCTAssertEqual(prettyString, "in half an hour")
    }
    
    func testPrettifyTimeIntervalWithThirtyMinuteLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -1800.5))
        XCTAssertEqual(prettyString, "about half an hour ago")
    }
    
    func testPrettifyTimeIntervalWithFiftyNineMinuteLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 3599.5))
        XCTAssertEqual(prettyString, "in an hour")
    }
    
    func testPrettifyTimeIntervalWithFiftyNineMinuteLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -3599.5))
        XCTAssertEqual(prettyString, "about an hour ago")
    }
    
    func testPrettifyTimeIntervalWithOneHourLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 3600.5))
        XCTAssertEqual(prettyString, "in 1 hour")
    }
    
    func testPrettifyTimeIntervalWithOneHourLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -3600.5))
        XCTAssertEqual(prettyString, "1 hour ago")
    }
    
    func testPrettifyTimeIntervalWithOneHourAndHalfLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 5400.5))
        XCTAssertEqual(prettyString, "in 1 hour")
    }
    
    func testPrettifyTimeIntervalWithOneHourAndHalfLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -5400.5))
        XCTAssertEqual(prettyString, "1 hour ago")
    }
    
    func testPrettifyTimeIntervalWithTwoHoursLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 7200.5))
        XCTAssertEqual(prettyString, "in 2 hours")
    }
    
    func testPrettifyTimeIntervalWithTwoHoursLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -7200.5))
        XCTAssertEqual(prettyString, "2 hours ago")
    }
    
    func testPrettifyTimeIntervalWithTwelveHoursLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 43200.5))
        let formatter = TTTTimeIntervalFormatter()
//        formatter.usesIdiomaticDeicticExpressions = true
        let pretttyDate = formatter.string(forTimeInterval: (907200 * 20))
        XCTAssertEqual(prettyString, "in 12 hours")
    }
    
    func testPrettifyTimeIntervalWithTwelveHoursLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -43200.5))
        XCTAssertEqual(prettyString, "12 hours ago")
    }
    
    func testPrettifyTimeIntervalWithTwentyThreeHoursLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 82800.5))
        XCTAssertEqual(prettyString, "in a day")
    }
    
    func testPrettifyTimeIntervalWithTwentyThreeHoursLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -82800.5))
        XCTAssertEqual(prettyString, "about a day ago")
    }
    
    func testPrettifyTimeIntervalWithOneDayLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 86400.5))
        XCTAssertEqual(prettyString, "tomorrow")
    }
    
    func testPrettifyTimeIntervalWithOneDayLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -86400.5))
        XCTAssertEqual(prettyString, "yesterday")
    }
    
    func testPrettifyTimeIntervalWithOneAndHalfDayLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 129600.5))
        XCTAssertEqual(prettyString, "tomorrow")
    }
    
    func testPrettifyTimeIntervalWithOneAndHalfDayLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -129600.5))
        XCTAssertEqual(prettyString, "yesterday")
    }

    func testPrettifyTimeIntervalWithTwoDaysLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 172800.5))
        XCTAssertEqual(prettyString, "in 2 days")
    }
    
    func testPrettifyTimeIntervalWithTwoDaysLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -172800.5))
        XCTAssertEqual(prettyString, "2 days ago")
    }
    
    func testPrettifyTimeIntervalWithSixDaysLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 518400.5))
        XCTAssertEqual(prettyString, "in 6 days")
    }
    
    func testPrettifyTimeIntervalWithSixDaysLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -518400))
        XCTAssertEqual(prettyString, "6 days ago")
    }
    
    func testPrettifyTimeIntervalWithSevenDaysLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: 604800.5))
        XCTAssertEqual(prettyString, "in 1 week")
    }
    
    func testPrettifyTimeIntervalWithSevenDaysLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: -604800))
        XCTAssertEqual(prettyString, "1 week ago")
    }
    
    func testPrettifyTimeIntervalWithFourWeeksLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: (604800 * 4) + 0.5))
        XCTAssertEqual(prettyString, "in 4 weeks")
    }
    
    func testPrettifyTimeIntervalWithFourWeeksLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: (-604800 * 4) + 0.5))
        XCTAssertEqual(prettyString, "4 weeks ago")
    }
    
    func testPrettifyTimeIntervalWithFiveWeeksLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: (604800 * 5) + 0.5))
        XCTAssertEqual(prettyString, "in 1 month")
    }
    
    func testPrettifyTimeIntervalWithFiveWeeksLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: (-604800 * 5) + 0.5))
        XCTAssertEqual(prettyString, "1 month ago")
    }
    func testPrettifyTimeIntervalWithFiveMonthsLargerThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: ((604800 * 5) * 5) + 0.5))
        XCTAssertEqual(prettyString, PrettyDateTests.constructDateFromMonths(withMonths: 6))
    }
    
    func testPrettifyTimeIntervalWithFiveMonthsLessThanCurrent() {
        let prettyString = Date.stringForTimeInterval(timeInterval: PrettyDateTests.timeInterval(withDifference: ((-604800 * 5) * 5) + 0.5))
        XCTAssertEqual(prettyString, PrettyDateTests.constructDateFromMonths(withMonths: -6))
    }
}
extension PrettyDateTests {
    
    static func timeInterval(withDifference timeInterval: TimeInterval) -> TimeInterval {
        return Date().addingTimeInterval(timeInterval).timeIntervalSince1970
    }
    
    static func constructDateFromMonths(withMonths months: Int) -> String {
        var expectedDatecomponents = DateComponents()
        expectedDatecomponents.month = months
        let expectedDateFromDateComponent = PrettyDateTests.constructExpectedDateFromDateComponent(dateComponent: expectedDatecomponents)
        
        return "on \(expectedDateFromDateComponent)"
    }
    
    private static func constructExpectedDateFromDateComponent(dateComponent: DateComponents) -> String {
        let calendar = Calendar.current
        guard let expectedDate = calendar.date(byAdding: dateComponent, to: Date()) else {
            return ""
        }
        return DateFormatter.localizedString(from: expectedDate, dateStyle: .medium, timeStyle: .none)
    }

}
