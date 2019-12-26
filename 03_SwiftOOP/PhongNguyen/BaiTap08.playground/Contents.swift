import Foundation
class Date {
    var day: Int
    var month: Int
    var year: Int
    init(day: Int, month: Int, year: Int){
        self.day = day
        self.month = month
        self.year = year
    }
    
    func printDate() {
        print("\(day)-\(month)-\(year)")
    }
    func daysIn() -> Int {
        var daysIn =  31
        switch self.month {
        case 4,6,8,9,11:
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
        
        while self.day > daysIn() || self.month > 12 {
            if self.day > daysIn(){
                    self.day = self.day - daysIn()
                    self.month += 1
                
            }
                if self.month > 12{
                    self.month = self.month - 12
                    year += 1
        }
            
            
        }
        if self.year < 1{
            year = 1998
        }
       
    }
    func advance(d: Int, m: Int, y: Int) {
        self.day += d
        self.month += m
        self.year += y
    }
}
var ngaythangnam = Date(day: 70,month: 15,year: 2015)
ngaythangnam.printDate()
ngaythangnam.normalize()
ngaythangnam.printDate()
ngaythangnam.advance(d: 10, m: 12, y: 10)
ngaythangnam.normalize()
ngaythangnam.printDate()
