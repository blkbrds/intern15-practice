import UIKit

//Ham tinh tong 100 so dau tien cua day Fibonacci
func tongFibonacci() -> Int {
    var Fibo: [Int] = []
    Fibo = Array(repeating: 0, count: 100)
    Fibo[0] = 1
    Fibo[1] = 1
    var sum = 2
    for i in 2...4 {
        Fibo[i] = Fibo[i - 2] + Fibo[i - 1]
        sum += Fibo[i]
    }
    return sum
}

//Ham liet ke 100 so Fibonacci dau tien
func lietKeFibonacci() {
    var Fibo: [Int] = []
    Fibo = Array(repeating: 0, count: 100)
    Fibo[0] = 1
    Fibo[1] = 1
    print(Fibo[0])
    print(Fibo[1])
    for i in 2...90 {
        Fibo[i] = Fibo[i - 2] + Fibo[i - 1]
        print(Fibo[i])
    }
}

//Liet ke cac so hanh phuc be hơn 100
func tongBinhPhuongCuaMotSo(soBanDau: Int) -> Int {
    var soTam = 0, soDuocCopy = soBanDau
    while (soDuocCopy != 0) {
        soTam += (soDuocCopy % 10) * (soDuocCopy % 10)
        soDuocCopy /= 10
    }
    return soTam
}

func kiemTraSoHanhPhuc(soCanKiemTra: Int) -> Bool {
    if soCanKiemTra == 1 {
        return true
    }
    var hanhPhuc = soCanKiemTra
    var mangTam: [Int] = []
    while hanhPhuc > 1 && !mangTam.contains(hanhPhuc) {
        mangTam.append(hanhPhuc)
        hanhPhuc = tongBinhPhuongCuaMotSo(soBanDau: hanhPhuc)
    }

    return hanhPhuc == 1
}

func lietKeSoHanhPhuc() {
    for i in 1...100 {
        if(kiemTraSoHanhPhuc(soCanKiemTra: i) == true) {
            print(i)
        }
    }
}

lietKeSoHanhPhuc()

