import UIKit

func tinhTongFibonacci() -> Int {
    var fibo: [Int] = []
    fibo = Array(repeating: 0, count: 100)
    fibo[0] = 1
    fibo[1] = 1
    var sum = 2
    for i in 2...100 {
        fibo[i] = fibo[i - 2] + fibo[i - 1]
        sum += fibo[i]
    }
    return sum
}

func lietKeFibonacci() {
    var fibo: [Int] = []
    fibo = Array(repeating: 0, count: 100)
    fibo[0] = 1
    fibo[1] = 1
    print(fibo[0])
    print(fibo[1])
    for i in 2...100 {
        fibo[i] = fibo[i - 2] + fibo[i - 1]
        print(fibo[i])
    }
}

func tinhTongBinhPhuongCuaMotSo(soBanDau: Int) -> Int {
    var soTam: Int = 0
    var soDuocCopy: Int = soBanDau
    while soDuocCopy != 0 {
        soTam += (soDuocCopy % 10) * (soDuocCopy % 10)
        soDuocCopy /= 10
    }
    return soTam
}

func kiemTraSoHanhPhuc(soCanKiemTra: Int) -> Bool {
    if soCanKiemTra == 1 {
        return true
    }
    var hanhPhuc: Int = soCanKiemTra
    var mangTam: [Int] = []
    while hanhPhuc > 1 && !mangTam.contains(hanhPhuc) {
        mangTam.append(hanhPhuc)
        hanhPhuc = tinhTongBinhPhuongCuaMotSo(soBanDau: hanhPhuc)
    }
    return hanhPhuc == 1
}

func lietKeSoHanhPhuc() {
    for i in 1...100 {
        if kiemTraSoHanhPhuc(soCanKiemTra: i) == true {
            print(i)
        }
    }
}

lietKeSoHanhPhuc()
tinhTongBinhPhuongCuaMotSo(soBanDau: 31)

