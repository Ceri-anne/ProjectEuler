//You are given the following information, but you may prefer to do some research for yourself.
//
//1 Jan 1900 was a Monday.
//Thirty days has September,
//April, June and November.
//All the rest have thirty-one,
//Saving February alone,
//Which has twenty-eight, rain or shine.
//And on leap years, twenty-nine.
//A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
//How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


import Foundation

func dayOfweek(for date: Date, calendar: Calendar = .current) -> Int {
   
    return calendar.component(.weekday, from: date)
    
}

func dateFromComponents(day: Int, month: Int, year: Int, calendar: Calendar = .current) -> Date {
    
    let dateComponents = DateComponents(calendar: calendar,
                                           year: year,
                                           month: month,
                                           day: day)
    
    return calendar.date(from: dateComponents)!
}

func firstMonthSundays() -> Int {
    
    var count = 0
    
    for year in 1901...2000 {
        for month in 1...12 {
            let date = dateFromComponents(day: 1, month: month, year: year)
            
            if dayOfweek(for: date) == 1 {
                count += 1
            }
            
        }
    }
    
    return count

}

firstMonthSundays()
