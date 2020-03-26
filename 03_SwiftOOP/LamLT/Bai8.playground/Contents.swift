import UIKit

class DateT {
    var day: Int
    var month: Int
    var year: Int

    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    func print() -> String {
        return "Day \(day) ,Month \(month) ,Year \(year)"
    }
    func checkLeapYear(y: Int) -> Bool {
        if y % 4 == 0 {
            return true
        } else {
            return false
        }
    }
    func daysIn(inputMonth: Int, inputYear: Int) -> Int {
        var instaneOfMonth = inputMonth
        switch instaneOfMonth {
        case 2:
            if inputYear % 4 == 0 {
                instaneOfMonth = 29
            } else {
                instaneOfMonth = 28
            }
        case 4, 6, 9, 11:
            instaneOfMonth = 30
        default:
            31
        }
        return instaneOfMonth
    }

    func normalize(d: DateT) -> String {
        let inputDay = d.day
        let inputMonth = d.month
        let inputYear = d.year
        var txt = ""
        if inputYear < 1 || inputMonth < 1 || inputMonth > 12 || inputDay < 1 || inputDay > 31 {
            txt = "Failed"
        }
        if checkLeapYear(y: inputYear) == true && inputMonth == 2 && inputDay > 29 {
            txt = "Failed"
        }
        if checkLeapYear(y: inputYear) == false && inputMonth == 2 && inputDay > 28 {
            txt = "Failed"
        }
        if checkLeapYear(y: inputYear) == false {
            txt = "Day \(inputDay) Month \(inputMonth) Year \(inputYear)"
        }
        return txt
    }

    func advance(inputDay: Int, inputMonth: Int, inputYear: Int, t: DateT) -> String {
        var checkDay = t.day
        var checkMonth = t.month
        var checkYear = t.year
        var outputDay: Int = inputDay + checkDay - 31
        var outputMonth: Int = inputMonth + checkMonth - 12
        var outputYear: Int = inputYear + checkYear
        return "Day \(outputDay) Month \(outputMonth) Year \(outputYear)"
    }
}
var t1 = DateT(day: 10, month: 10, year: 2010)
t1.daysIn(inputMonth: t1.month, inputYear: t1.year)
t1.normalize(d: t1)
t1.advance(inputDay: 5, inputMonth: 5, inputYear: 5, t: t1)
