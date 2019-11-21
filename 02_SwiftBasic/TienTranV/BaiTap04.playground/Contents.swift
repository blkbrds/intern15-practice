import UIKit

//Tổng của 10 số Fibonacy đầu tiên
func fibonacy(n: Int) -> Int {
    var a = 1
    var b = 1
    var c = 0
    for i in 0..<n {
        if i <= 1 {
            c = i
        } else {
            c = a + b
            a = b
            b = c
        }
    }
    return c
}

func tinhTongNFibonacyDauTien(n: Int) -> Int {
    var tong = 0
    for i in 0..<n {
        tong += fibonacy(n: i)
    }
    return tong
}

let tongDayFibonacy = tinhTongNFibonacyDauTien(n: 10)
print("Tong 10 so Fibonacci dau tien la: \(tongDayFibonacy)")

//Liệt kê 10 số Fibonacy đầu tiên
func lietKeNFibonacyDautien(n: Int) {
    for i in 0..<n {
        let soFibonacy = fibonacy(n: i)
        print("F(\(i)) = \(soFibonacy)")
    }
}
print("\nLiet ke 10 so fibonacy dau tien")
lietKeNFibonacyDautien(n: 10)

//Tính sin(x), cos(x) bằng công thức Chuỗi Taylor
func giaiThua(n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return n * giaiThua(n: n - 1)
    }
}

func sinX(goc: Double) -> Double {
    let saiSo = 0.00001
    var tinhToan = 1.0
    var n = 0
    var sinX = 0.0
    let gocRad = goc * .pi / 180
    while tinhToan > saiSo {
        tinhToan = pow(gocRad, Double((2 * n + 1))) / Double(giaiThua(n: 2 * n + 1))
        if n % 2 == 0 {
            sinX += tinhToan
        } else {
            sinX -= tinhToan
        }
        n += 1
    }
    return sinX
}

func cosX(goc: Double) -> Double {
    let saiSo = 0.00001
    var tinhToan = 1.0
    var n = 0
    var cosX = 0.0
    let gocRad = goc * .pi / 180
    while tinhToan > saiSo {
        tinhToan = pow(gocRad, Double((2 * n))) / Double(giaiThua(n: 2 * n))
        if n % 2 == 0 {
            cosX += tinhToan
        } else {
            cosX -= tinhToan
        }
        n += 1
    }
    return cosX
}

print("\nSin(90) = \(sinX(goc: 90))")
print("\nCos(45) = \(cosX(goc: 45))")

/*Liệt kê các số hạnh phúc bé hơn 100 : Số hạnh phúc là số https://en.wikipedia.org/wiki/Happy_number */
func tongBinhPhuongMoiSo(so: Int) -> Int { // Tong binh phuong tung so trong mot so
    var soTam = so
    var tong = 0
    var phanDu = 0
    while soTam > 0 {
        phanDu = soTam % 10
        tong += phanDu * phanDu
        soTam = soTam / 10
    }
    return tong
}

func ktSoHanhPhuc(so: Int) -> Bool {
    if so == 1 {
        return true
    }
    var hanhPhuc = so
    var mangTam: [Int] = []
    while hanhPhuc > 1 && !mangTam.contains(hanhPhuc) {
        mangTam.append(hanhPhuc)
        hanhPhuc = tongBinhPhuongMoiSo(so: hanhPhuc)
    }
    
    return hanhPhuc == 1
}

func lietKeSoHanhPhuc(n: Int) -> [Int] {
    var mangHanhPhuc: [Int] = []
    for i in 0..<n {
        if ktSoHanhPhuc(so: i) {
            mangHanhPhuc.append(i)
        }
    }
    return mangHanhPhuc
}

print("\nLiet ke so hanh phuc nho hon 100: \(lietKeSoHanhPhuc(n: 100))")
