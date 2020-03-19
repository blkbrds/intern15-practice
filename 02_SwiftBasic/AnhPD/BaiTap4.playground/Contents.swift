import UIKit

func tong100SoFiBoNaCyVaLietKe() {
    var tong: Int = 0
    var x0: Int = 1
    var x1: Int = 1
    var tam: Int = x0
    for _ in 0...5 {
        tong = tong + x0
        x0 = x1
        x1 = x1 + tam
        print("\(tam)")
        tam = x0
    }
    print("Tong bang = \(tong)")
}
tong100SoFiBoNaCyVaLietKe()

//tinh sinx cosx bang cong thuc chuoi taylor
func giaiThua(n: Double) -> Double{
    if n > 0 {
        return n * giaiThua(n: n-1)
    } else {
        return 1
    }
}

func tinhSinx(x: Double,n: Double) -> Double {
    var sinx: Double = 0
    sinx = pow(-1,n) * ((pow(x, 2 * n + 1)) / ((2 * n + 1) * giaiThua(n: n)))
    return sinx
}
tinhSinx(x: 2, n: 16)
func tinhcosx() {
    var cosx: Double = 0
    cosx = sqrt(1 - (tinhSinx(x: 2, n: 1)) * tinhSinx(x: 2, n: 16))
}
tinhcosx()
//Liệt kê số hạnh phúc bé hơn 10000
func tongbinhphuong(n: Int) -> Int {
    var s: Int = 0
    var m: Int = n
    while m > 0 {
        s = s + (m % 10) * (m % 10)
        m = m / 10
    }
    return s
}
print(tongbinhphuong(n: 100))
func ktrasohanhphuc(n: Int) -> Bool {
    var s = n
        for i in 0...100 {
            s = tongbinhphuong(n: s)
        }
    if s == 1 {
        return true
    } else {
        return false
    }
}
print(ktrasohanhphuc(n: 100))
func lietkesohanhphuc() {
    for i in 0...100{
        if(ktrasohanhphuc(n: i)){
            print(i)
        }
    }
}
print(lietkesohanhphuc())
