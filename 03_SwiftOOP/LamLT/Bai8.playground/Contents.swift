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
    func daysIn(m: Int, y: Int) -> Int {
        var m1 = m
        let d = 31
        switch m1 {
        case 2:
            if y % 4 == 0 {
                m1 = 29
            } else {
                m1 = 28
            }
        case 4, 6, 9, 11:
            m1 = 30
        default:
            31
        }
        return d
    }

    func normalize(d: DateT) -> String {
        let x = d.day
        let y = d.month
        let z = d.year
        var txt = ""
        if z < 1 || y < 1 || y > 12 || x < 1 || x > 31 {
            txt = "Failed"
        }
        if checkLeapYear(y: z) == true && y == 2 && z > 29 {
            txt = "Failed"
        }
        if checkLeapYear(y: z) == false && y == 2 && z > 28 {
            txt = "Failed"
        }
        if checkLeapYear(y: z) == false {
            txt = "Day \(x) Month \(y) Year \(z)"
        }
        return txt
    }

    func advance(a: Int, b: Int, c: Int, t: DateT) -> String {
        var x = t.day
        var y = t.month
        var z = t.year
        var q: Int = a + x - 31
        var w: Int = b + y - 12
        var e: Int = z + c
        return "Day \(q) Month \(w) Year \(e)"
    }
}
var t1 = DateT(day: 10, month: 10, year: 2010)
t1.daysIn(m: t1.month, y: t1.year)
t1.normalize(d: t1)
t1.advance(a: 5, b: 5, c: 5, t: t1)
