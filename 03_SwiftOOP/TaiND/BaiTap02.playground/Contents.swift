import UIKit

class DaGiac {
    var soCanh: Double = 0
    var arrCanh: [Double] = []
    init(soCanh: Double, arrCanh: [Double] = []) {
        self.soCanh = soCanh
        guard soCanh <= 2 else {
            self.arrCanh = arrCanh
            return
        }
    }

    func chuVi() -> Double {
        var cv = 0.0
        guard !arrCanh.contains(0.0) || soCanh > 2 || soCanh == Double(arrCanh.count) else {
            print("Khong phai da giac, hoac nhap sai so canh")
            return cv
        }
        for value in arrCanh {
            if value == 0 {
                cv = 0.0
                print("Khong the co canh bang 0")
                break
            } else {
                cv += value
            }
        }
        return cv
    }

    func printCanh() -> Void {
        for value in arrCanh {
            print("Canh cua da giac: \(value)")
        }
    }
}

var f = DaGiac(soCanh: 4, arrCanh: [1.0, 5.0, 3.0, 4.0])

f.printCanh()
print("Chu vi cua da giac la: \(f.chuVi())")

print("Bai 03: ")

class TamGiac: DaGiac {
    var cv = 0.0
    override func chuVi() -> Double {
        if soCanh != Double(arrCanh.count) {
            print("Nhap sai so canh")
        } else if soCanh != 3 {
            print("Khong phai tam giac")
        } else {
            for i in arrCanh {
                cv += i
            }
        }
        return cv
    }

    func dienTich() -> Double {
        var s = 1.0
        let p: Double = (arrCanh[0] + arrCanh[1] + arrCanh[2]) / 2
        if soCanh != 3 {
            print("Khong phai tam giac")
        } else {
            s = sqrt(p * (p - arrCanh[0]) * (p - arrCanh[1]) * (p - arrCanh[2]))
        }
        return s
    }
}
let dientich = TamGiac(soCanh: 3, arrCanh: [3, 4, 5])
print("Dien tich tam giac la:\(dientich.dienTich())")

print("Bai 04")

func pytago(tamgiac: TamGiac) -> Bool {
    if tamgiac.arrCanh[0] * tamgiac.arrCanh[0] + tamgiac.arrCanh[1] * tamgiac.arrCanh[1] == tamgiac.arrCanh[2] * tamgiac.arrCanh[2] || tamgiac.arrCanh[0] * tamgiac.arrCanh[0] + tamgiac.arrCanh[2] * tamgiac.arrCanh[2] == tamgiac.arrCanh[1] * tamgiac.arrCanh[1] ||
        tamgiac.arrCanh[2] * tamgiac.arrCanh[2] + tamgiac.arrCanh[1] * tamgiac.arrCanh[1] == tamgiac.arrCanh[0] * tamgiac.arrCanh[0] {
        return true
    }
    return false
}
func tamGiacPytago(tamgiaca: [TamGiac]) {
    for tamgiac in tamgiaca where pytago(tamgiac: tamgiac) {
        print(tamgiac.arrCanh)
    }
}

print("Bai 09")

class Mang1c {
    var a: [Int] = []

    init(a: [Int]) {
        self.a = a
    }
    func max(a: [Int]) -> Int {
        var max: Int = a[0]
        for i in 0..<a.count {
            if max < a[i] {
                max = a[i]
            }
        }
        return max
    }

    func min(a: [Int]) -> Int {
        var min: Int = a[0]
        for i in 0..<a.count {
            if (min > a[i]) {
                min = a[i]
            }
        }
        return min
    }

    func inMang() {
        print("Phan tu lon nhat cua mang:\(max(a: a))")
        print("Phan tu nho nhat cua mang:\(min(a: a))")
    }
}
let xuat = Mang1c(a: [5, 2, 1, 2, 3])
xuat.inMang()

print("Bai 10")

class A {
    func sum(n: Int) -> Int {
        var s = 0
        for i in 0...10 {
            s = s + i
        }
        return s
    }
}
let a = A().sum(n: 10)
print("Tong cua n so nguyen: \(a)")






















