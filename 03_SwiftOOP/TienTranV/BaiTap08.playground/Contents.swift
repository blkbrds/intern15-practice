import UIKit

final class Date {
    var day: Int
    var month: Int
    var year: Int

    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    func daysIn() -> Int {
        var daysIn = 31
        switch self.month {
        case 4, 6, 9, 11:
            daysIn = 30
        default:
            if (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) {
                daysIn = 29
            } else {
                daysIn = 28
            }

        }
        return daysIn
    }

    func normalize() {
        guard day < daysIn() else {
            return self.day = 11
        }
        guard month < 12 else {
            return self.month = 10
        }
        guard year > 1 else {
            return self.year = 1997
        }
    }

    func printDate() {
        print("\(day)-\(month)-\(year)")
    }

    func advance(d: Int, m: Int, y: Int) {
        self.day = d
        self.month = m
        self.year = y
    }
}

var date = Date(day: 28, month: 2, year: 0)
date.printDate()
date.normalize()
date.printDate()
date.advance(d: 11, m: 10, y: 1997)
date.printDate()
