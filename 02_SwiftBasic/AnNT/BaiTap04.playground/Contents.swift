import UIKit

//Tong 100 fibonacy dau tien
func sumFibonacy(number: Int) -> Double {
    var sum = 0.0
    var a = 1.0
    var b = 1.0
    for _ in 1...number {
        let c = a + b
        a = b
        b = c
        sum += c
    }
    return sum
}
sumFibonacy(number: 100)

//Liet ke 100 fibonacy dau tien
func showFibonacy(number: Int) {
    var a = 1.0, b = 1.0
    for _ in 1...number {
        let c = a + b
        a = b
        b = c
        //print("\(c)", terminator: " ")
    }
}
showFibonacy(number: 100)

//Tinh sin(x), cos(x) Taylor

func F(x: Float, n: Int) -> Float {
    let a: Float = n % 2 == 0 ? 1 : -1
    var temp: Float = 1
    for i in 1...2 * n + 1 {
        temp *= x / Float(i)
    }
    return a * temp
}

func sinX(x: Float)  -> Float {
    var n = 0, sin: Float = 0
    while abs(F(x: x, n: n)) > 0.00001 {
        sin += F(x: x, n: n)
        n += 1
    }
    return sin
}
sinX(x: 0.5235)

func cosX(x: Float) -> Float {
    return sqrtf(1 - sinX(x: x) * sinX(x: x))
}

cosX(x: 0.5235)


//So hanh phuc < 10000 %2==0 && daoNguoc == xuoi
func showHappyNumber(lessThan: Int) {
    for number in stride(from: 0, to: lessThan, by: 2) {
        let reverNumberStr = String(String(number).reversed())
        if reverNumberStr == String(number) {
            print("\(number)", terminator: " ")
        }
    }
}
showHappyNumber(lessThan: 10000)
