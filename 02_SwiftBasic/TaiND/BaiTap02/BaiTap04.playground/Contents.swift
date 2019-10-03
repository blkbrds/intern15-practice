import UIKit

func fiBonacy (n: Int) {
    var a: Int = 0
    var b: Int = 1
    var c: Int = a + b
    var Tong: Int = 0
    var n = n - 2
    while n > 0 {
        print(c)
        a = b
        b = c
        c = a + b
        n = n - 1
        Tong = Tong + c
    }
    print(Tong)
}
fiBonacy(n: 10)

//Tính sin(x), cos(x) bằng công thức Chuỗi Taylor
let temp : Float = 0.0000001
func sinX(x : Float) -> Float {
    var S : Float = 0
    let X : Float = x * Float.pi / 180
    var a : Float = X
    var i : Float = 3
    while abs(a) >= temp {
        S = S + a
        a = a * (-(X * X / (i * (i - 1))))
        i = i + 2
    }
    return S
}
func cosX(x: Float) -> Float {
    var S : Float = 0
    let X : Float = x * Float.pi / 180
    var a : Float = X
    var i : Float = 3
    while abs(a) >= temp {
        S = S + a
        a = a * (-1) * (X * X) / (i * (i + 1))
        i = i + 2
    }
    return S
}
print("Sin(30) = \(sinX(x:30))")
print("Cos(30) = \(cosX(x:30))")

//chi so hanh phúc
func isHappyNumber() {
    var tong: Int = 0
    for i in 3..< 50 {
        for j in 1..< i - 1 where i % j == 0 {
            tong = tong + j
        }
        if tong == i {
            print("So tuyet hao la=", i)
        }
        tong = 0
    }
}
isHappyNumber()
