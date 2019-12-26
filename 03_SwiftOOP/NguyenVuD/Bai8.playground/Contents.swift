class Date {
    var ngay: Int
    var thang: Int
    var nam: Int
    
    init(ngay: Int, thang: Int, nam: Int){
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }
    
    func daysIn() -> Int {
        var daysIn : Int
        switch thang {
        case 4, 6, 9, 11:
            daysIn = 30
        case 1, 3, 5, 7, 8, 10, 12:
            daysIn = 31
        default:
            if (nam % 400 == 0) || (nam % 4 == 0 && nam % 100 != 0){
                daysIn = 29
            } else {
                daysIn = 28
            }
        }
        return daysIn
    }
    
    func normalize() {
        guard ngay < daysIn() else {
            return ngay = 14
        }
        guard thang < 12 else {
            return self.thang = 10
        }
        guard nam > 1 else {
            return self.nam = 1998
        }
    }

    func printDate() {
        print("\(ngay)-\(thang)-\(nam)")
    }

    func advance(d: Int, m: Int, y: Int) {
        self.ngay = d
        self.thang = m
        self.nam = y
    }
}

var date = Date(ngay: 28, thang: 2, nam: 0)
date.printDate()
date.normalize()
date.printDate()
date.advance(d: 14, m: 12, y: 1998)
date.printDate()
