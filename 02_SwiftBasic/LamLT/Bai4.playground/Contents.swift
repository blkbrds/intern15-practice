import UIKit

class Fibonacci {
    var f0: Int = 0, f1: Int = 1, fn: Int = 0

    func listOfFibonacci(n: Int) -> (Int) {
        for i in 1...n {
            if i == 1 {
                print(f0)
                continue
            }
            if i == 2 {
                print(f1)
                continue
            }
            fn = f0 + f1
            f0 = f1
            f1 = fn

            print(fn)
        }
        return fn
    }

    func sumOfFibonacci(n: Int) -> Int {
        var sum: Int = 0

        for _ in 0..<n {
            fn = f0 + f1
            sum += fn
            f0 = f1
            f1 = fn
        }
        print("Sum Of Fibonacci : \(sum)")
        return sum
    }

    func sinCosWithTaylor(x: Float) -> (Float, Float) {
        var sin: Float = 0
        var cos: Float = 0
        let x: Float = x * Float.pi / 180
        var temp: Float = x
        var i: Float = 3

        while abs(temp) >= 0.00001 {
            sin += temp
            temp = temp * (-(x * x / (i * (i - 1))))
            i += 2
        }
        cos = sqrt(1 - sin * sin)
        print("Sin = \(sin) \nCos = \(cos)")
        return (sin, cos)
    }

    func listHappyNumber(i: Int) {
        var sum: Int = 0

        for i in 3..<i {
            for j in 1..<i - 1 {
                if i % j == 0 {
                    sum += j
                }
                if sum == i {
                    print("\(i) is happy number ")
                }
                sum = 0
            }
        }
    }
}

let x = Fibonacci()
x.listOfFibonacci(n: 10)
let y = Fibonacci()
y.sumOfFibonacci(n: 2)
let z = Fibonacci();
z.sinCosWithTaylor(x: 1)
z.listHappyNumber(i: 50)
