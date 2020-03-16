import UIKit
//Tính tổng Fibonacy
func tongFibonacy () -> Double {
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
print(tongFibonacy())
//Liệt kê Fibonacy
func lietkeFibonacy () {
    var s1: Int = 1
    var s2: Int = 1
    var k : Int = s1
    for _ in 0...10 {
        print(s1)
        s1 = s2
        s2 = s2 + k
        k = s1
    }
}
print(lietkeFibonacy())
//Tính sinx cosx theo chuỗi Taylor
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
print(sinx(x: 5, n: 15))
func cosx() -> Double{
    var cosx = 1 - sinx(x: 5, n: 15) * sinx(x: 5, n: 15)
    return sqrt(cosx)
}
print(cosx())
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


