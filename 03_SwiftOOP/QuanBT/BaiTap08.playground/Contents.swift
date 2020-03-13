import UIKit

final class Dates {
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func daysIn() -> Int {
        var result = 31
        switch self.month {
        case 11, 9, 6, 4:
            result = 30
        default:
            if self.year % 100 == 0 && self.year % 400 == 0 {
                result = 29
            } else if self.year % 4 == 0 {
                result = 29
            } else {
                result = 28
            }
        }
        return result
    }
    
    func printDates() {
        print("\(day)/\(month)/\(year)")
    }
    
    func normalize() {
        if self.day > daysIn() || self.day < 1 {
            self.day = 14
        }
        if self.month > 12 || self.month < 1 {
            self.month = 2
        }
        if self.year < 1 {
            self.year = 1998
        }
    }
    
    func advance(d: Int, m: Int, y: Int) {
        self.day = d
        self.month = m
        self.year = y
    }
}

var date: Dates = Dates(day: 11, month: 3, year: 2020)
date.printDates()
date.advance(d: 29, m: 2, y: 2020)
date.printDates()
date.advance(d: 0, m: 0, y: 0)
date.normalize()
date.printDates()
