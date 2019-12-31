import UIKit

//Bai tap 1
class PhanSo {
    var tuSo: Int
    var mauSo: Int

    init(tuSo: Int, mauSo: Int) {
        self.mauSo = mauSo
        self.tuSo = tuSo
        self.rutGon()
    }

    func rutGon() {
        var t = self.tuSo, m = self.mauSo
        while t * m != 0 {
            if t > m {
                t %= m
            } else {
                m %= t
            }
        }
        let ucln = t + m
        self.tuSo /= ucln
        self.mauSo /= ucln
    }

    static func + (l: PhanSo, r: PhanSo) -> PhanSo {
        let ps = PhanSo(tuSo: l.tuSo * r.mauSo + l.mauSo * r.tuSo, mauSo: l.mauSo * r.mauSo)
        ps.rutGon()
        return ps
    }

    static func - (l: PhanSo, r: PhanSo) -> PhanSo {
        let ps = PhanSo(tuSo: l.tuSo * r.mauSo - l.mauSo * r.tuSo, mauSo: l.mauSo * r.mauSo)
        ps.rutGon()
        return ps
    }

    static func * (l: PhanSo, r: PhanSo) -> PhanSo {
        let ps = PhanSo(tuSo: l.tuSo * r.tuSo, mauSo: l.mauSo * r.mauSo)
        ps.rutGon()
        return ps
    }

    static func / (l: PhanSo, r: PhanSo) -> PhanSo {
        let ps = PhanSo(tuSo: l.tuSo * r.mauSo, mauSo: l.mauSo * r.tuSo)
        ps.rutGon()
        return ps
    }

    func xuatPhanSo() {
        print("\(self.tuSo)/\(mauSo)")
    }
}

let ps1 = PhanSo(tuSo: 10, mauSo: 4)
let ps2 = PhanSo(tuSo: 4, mauSo: 3)
(ps1 + ps2).xuatPhanSo()

//Bai tap 2
class DaGiac {
    let soCanh: Int
    let kichThuocCanh: [Int]

    init(soCanh: Int, kichThuocCanh: [Int]) {
        self.soCanh = soCanh
        self.kichThuocCanh = kichThuocCanh
    }

    func tinhChuVi() -> Int {
        return self.kichThuocCanh.reduce(0, { $0 + $1 })
    }

    func hienThiGiaTriCacCanh() {
        self.kichThuocCanh.map({ canh in
            print("\(canh)", terminator: "-")
        })
    }
}

//Bai tap 3

class TamGiac: DaGiac {

    init(kichThuocCanh: [Int]) {
        super.init(soCanh: 3, kichThuocCanh: kichThuocCanh)
    }

    override func tinhChuVi() -> Int {
        return self.kichThuocCanh.reduce(0, { $0 + $1 })
    }

    func tinhDienTich() -> Float {
        let nuaChuVi = Float(self.tinhChuVi()) / 2
        let a = self.kichThuocCanh[0], b = self.kichThuocCanh[1], c = self.kichThuocCanh[2]
        return sqrtf(nuaChuVi * (nuaChuVi - Float(a)) * (nuaChuVi - Float(b) * (nuaChuVi - Float(c))))
    }
}

//Bai tap 4

class TamGiacVuong {
    let a: Int
    let b: Int
    let c: Int

    init(a: Int, b: Int, c: Int) {
        self.a = a
        self.b = b
        self.c = c
    }

    //Kiem tra co phai tam giac vuong
    func kiemTraCacCanh() -> Bool {
        var kiemTra = (self.a * self.a + self.b * self.b) == self.c * self.c
        kiemTra = kiemTra || (self.a * self.a + self.c * self.c) == self.b * self.b
        kiemTra = kiemTra || (self.c * self.c + self.b * self.b) == self.a * self.a
        return kiemTra
    }
}


//Bai tap 5

class CStack {
    var elements: [Int]
    var maxLength: Int
    
    init() {
        self.elements = []
        self.maxLength = 0
    }
    
    init(elements: [Int], maxLength: Int) {
        self.elements = elements
        self.maxLength = maxLength
    }
    
    convenience init(maxLength: Int){
        self.init(elements: [], maxLength: maxLength)
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func isFull() -> Bool {
        return elements.count == maxLength
    }
    
    func push(element: Int) {
        elements.append(element)
    }
    
    func pop(){
        self.elements.remove(at: 0)
    }
}


//Bai tap 6

class HinhVe {
    func tinhDienTich() { }
}

class HinhHaiChieu: HinhVe {
    func tinhChuVi() { }
}

class HinhBaChieu: HinhVe {
    func tinhTheTich() { }
}

class Tron: HinhHaiChieu {
    override func tinhDienTich() { }

    override func tinhChuVi() { }
}

class Vuong: HinhHaiChieu {
    override func tinhDienTich() { }

    override func tinhChuVi() { }
}

class TamGiac1: HinhHaiChieu {
    override func tinhDienTich() { }

    override func tinhChuVi() { }
}

class HinhCau: HinhBaChieu {
    override func tinhDienTich() { }

    override func tinhTheTich() { }
}

class HinhLapPhuong: HinhBaChieu {
    override func tinhDienTich() { }

    override func tinhTheTich() { }
}



//Bai tap 7

class Student {
    var name: String
    var birthday: Date
    var totalScore: Int

    init() {
        self.name = ""
        self.birthday = Date(day: 1, month: 1, year: 1)
        self.totalScore = 0
    }

    init(name: String, birthday: Date, totalScore: Int) {
        self.name = name
        self.birthday = birthday
        self.totalScore = totalScore
    }

    func inputStudent() {
        self.name = readLine() ?? ""
        self.totalScore = Int(readLine() ?? "") ?? 0
        self.birthday = Date.inputDate()
    }
}

class ManagerStudent {
    var students = [Student]()

    func inputStudents(numberOfStudent: Int) {
        for _ in 1...numberOfStudent {
            let student = Student()
            student.inputStudent()
            self.students.append(student)
        }
    }

    //Sort by totalScore, year of birthday
    func sortStudents() {
        for i in 0..<self.students.count - 1 {
            for j in i..<self.students.count {
                if students[i].totalScore > students[j].totalScore || students[i].birthday.getYear() < students[j].birthday.getYear() {
                    let temp = students[i]
                    students[i] = students[j]
                    students[j] = temp
                }
            }
        }
    }

    func printStudents() {
        sortStudents()
        self.students.map({ student in
            let name = student.name
            let secondIndex = name.index(after: name.startIndex)
            print("\(String(describing: name.first?.uppercased()))\(name[secondIndex...])")
        })
    }

}


//Bai tap 8

class Date {
    private var day: Int
    private var month: Int
    private var year: Int

    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    func getMonth() -> Int {
        return self.month
    }

    func getYear() -> Int {
        return self.year
    }

    func getDay() -> Int {
        return self.day
    }

    func daysIn(month: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 11:
            return 31
        case 4, 6, 9, 12:
            return 30
        case 2:
            return self.year % 400 == 0 || (self.year % 4 == 0 && self.year % 100 != 0) ? 29 : 28
        default:
            return 0
        }
    }

    func normalize() {
        if self.month > 12 || self.month < 1 {
            self.month = 1
        }
        if self.year > daysIn(month: self.month) || self.day < 1 {
            self.day = daysIn(month: self.month)
        }
    }

    func advance(year: Int, month: Int, day: Int) {
        self.day += day
        self.year += year
        self.month += month
    }

    func printDate() {
        print("\(self.day)/\(self.month)/\(self.year)")
    }

    static func inputDate() -> Date {
        return Date(day: Int(readLine() ?? "") ?? 1, month: Int(readLine() ?? "") ?? 1, year: Int(readLine() ?? "") ?? 1)
    }
}

let date = Date(day: 1, month: 2, year: 2019)
date.getDay()
date.normalize()
date.printDate()



//Bai tap 9

class Mang1C {
    private let numbers: [Int]

    init(numbers: [Int]) {
        self.numbers = numbers
    }

    func showNumbers() {
        self.numbers.map({ number in
            print("\(number)", terminator: " ")
        })
    }

    func maxInNumbers() -> Int? {
        return numbers.max()
    }

    func minInNumbers() -> Int? {
        return numbers.min()
    }
}


//Bai tap 10
//s = 1 + 2 + .. + n

class A {
    private let s: Int = 0
    private let n: Int

    init(n: Int) {
        self.n = n
    }

    func getS() -> Int {
        return self.n * (self.n + 1) / 2
    }
}
