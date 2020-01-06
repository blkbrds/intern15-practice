import UIKit

class Date {
    var day: Int
    var month: Int
    var year: Int

    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    func print() -> String {
        return "\(self.day)/\(self.month)/\(self.year)"
    }

    func daysIn() -> Int {
        var numberOfDays: Int = 0
        switch self.month {
        case 1, 3, 5, 7, 8, 10, 12:
            numberOfDays = 31
        case 4, 6, 9, 11:
            numberOfDays = 30
        case 2:
            numberOfDays = 28
        default: break
        }
        return numberOfDays
    }

    func normalize() -> String {
        var notificationString = "Valid data"
        guard day < daysIn() else {
            notificationString = "Invalid data"
            return notificationString
        }
        guard month < 12 else {
            notificationString = "Invalid data"
            return notificationString
        }
        guard year > 1 else {
            notificationString = "Invalid data"
            return notificationString
        }
        return notificationString
    }
    
    func advance(d: Int, m: Int, y: Int) {
        self.day = d
        self.month = m
        self.year = y
    }
}

let myBirthday: Date = Date(day: 16, month: 6, year: 1998)
print(myBirthday.print())
print(myBirthday.daysIn())
print(myBirthday.normalize())

myBirthday.advance(d: 9, m: 12, y: 2019)
print(myBirthday.print())

