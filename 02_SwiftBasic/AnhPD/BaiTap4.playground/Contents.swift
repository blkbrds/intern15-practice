import UIKit
func TongFibonacy () -> Double {
    var s : Double = 0
    var s1 : Double = 1
    var s2 : Double = 1
    var k : Double = s1
    for _ in 0...10 {
        s = s + s1
        s1 = s2
        s2 = s2 + k
        k = s1
    }
    return s
}
TongFibonacy()
func LietkeFibonacy () {
    var s1: Double = 1
    var s2: Double = 1
    var k : Double = s1
    for _ in 0...10 {
        print(s1)
        s1 = s2
        s2 = s2 + k
        k = s1
    }
}
LietkeFibonacy()
func giaithua(n : Double) -> Double{
    if(n>1) {
        return n * giaithua(n: n-1)
    }else {
        return 1
    }
}
func sinx(x: Double,n: Int) -> Double {
    var sinx : Double = 0
    let t : Double = -1
    for i in 0 ..< n {
        let a: Double = (2 * Double(i) + 1)
        sinx = sinx + pow(t,Double(i)) * pow(x,a)/giaithua(n: a)
    }
    return sinx
}
sinx(x: 0.5, n: 10)
