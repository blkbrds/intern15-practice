import UIKit
import Foundation
//Ham tinh tong fibonaci
func tinhTongFibbo(n: Int)->(Int){
    var a1: Int = 0
    var a2: Int = 1
    var tong: Int = 0
    var tong1: Int = 1
    switch n {
    case 0:
        tong1 = 0
        break
    case 1:
        tong1 = 1
        break
    case 2:
        tong1 = 2
        break
    default:
    for _ in 2...n{
        tong = a1 + a2
        a1 = a2
        a2 = tong
        tong1 += tong
    }
    }
    return tong1
}
print(tinhTongFibbo(n: 90))


//Ham in ra n so fibonacci
func inFibo(n: Int) {
    var fibo: [Int] = []
    fibo = Array(repeating: 0, count: 100)
    fibo[0] = 0
    fibo[1] = 1
    print(fibo[0])
    print(fibo[1])
    for i in 2...n {
        fibo[i] = fibo[i - 1] + fibo[i - 2]
        print(fibo[i])
    }
}
print(inFibo(n: 50))
//Tính sin(x), cos(x) bằng công thức Chuỗi Taylor
let temp: Float = 0.0000001
func sinXcosX(goc: Float) -> (S: Float,C : Float){
    var S: Float = 0
    var C: Float = 0
    let rad: Float = goc * Float.pi / 180
    var a: Float = rad
    var b: Float = rad
    var i: Float = 3
    while abs(a) >= temp {
        S += a
        C += b
        a = a * (-(rad * rad / (i * (i - 1))))
        b = b * (-(rad * rad / (i * (i + 1))))
        i = i + 2
    }
    return (S,C)
  
}

print (sinXcosX(goc: 40))


//so hanh phuc
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

func lietKeShp(n: Int) -> [Int] {
    var mangHanhPhuc: [Int] = []
    for i in 0..<n {
        if ktSoHanhPhuc(so: i) {
            mangHanhPhuc.append(i)
        }
    }
    return mangHanhPhuc
}

print("\nDay so hanh phuc nho hon 100: \(lietKeShp(n: 100))")

