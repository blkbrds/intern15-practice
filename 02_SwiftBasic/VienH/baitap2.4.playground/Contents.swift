
import UIKit

func lietKeFibonacci(n: Int, a: Int, b: Int, c: Int) -> Int {
    var a: Int = 0
    var b: Int = 1
    var c: Int = a + b
    var kq: Int = 0
    var n = n - 2
    while n > 0 {
        a = b
        b = c
        c = a + b
        n -= 1
        kq = kq + c
    }
    return kq
}

let kq = lietKeFibonacci(n: 20, a: 0, b: 1, c: 0)
print("Ket qua tra ve: \(kq)")

// Liet ke 100 so Fibonanci va tinh tong


let temp: Float = 0.0000001
func sinX(x: Float) -> Float {
    var S: Float = 0
    let X: Float = x * Float.pi / 180
    var a: Float = X
    var i: Float = 3
    while abs(a) >= temp {
        S += a
        a = a * (-(X * X / (i * (i - 1))))
        i = i + 2
    }
    return S
}

func cosX(x: Float) -> Float {
    var c: Float = 0
    let f: Float = x * Float.pi / 180
    var a: Float = f
    var i: Float = 3
    while abs(a) >= temp {
        c += a
        a = a * (-1) * (f * f) / (i * (i + 1))
        i = i + 2
    }
    return c
}
print ("Sin(30) = \(sinX(x: 30))")
print ("Cos(30) = \(cosX(x: 30))")
// Tinh xin(x), cos(x) bang chuoi Taylor

func cshp(max: Int) -> Int {
    var tong: Int = 0
    for i in 3..<max {
        for j in 1..<i - 1 where i % j == 0 {
            tong = tong + j
        }
        if tong == i {
            print("con số hạnh phúc là: ", i)
        }
    }
    return tong
}
let sohanhphuc = cshp(max: 10000)
print("Tong cac so hanh phuc la: \(sohanhphuc)")
// Liet ke cac so hanh phuc < 10000


