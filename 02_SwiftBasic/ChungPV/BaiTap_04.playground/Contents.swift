import Foundation

// Return so Fibonacci thu n
public func fibonacci(n: Int) -> Int{
    if n<0{
        return -1
    } else if n == 0 || n == 1 {
        return n
    } else {
        return fibonacci(n:n-1) + fibonacci(n:n-2)
    }
}
// Bai 4.1 Sum fibonnaci thu n
public func sumFibonacci(m: Int) -> Int{
    var sum: Int = 0
    for i in 0...m-1{
        sum += fibonacci(n: i)
    }
    return sum
}
//call sumFibonacci
let m = 10
print("Bai 4.1, Sum Fibonacci: \(sumFibonacci(m: m))")


//Bai 4.2 liet ke 100 so fibonacci
public func lietKe(x: Int){
    for j in 0...x-1{
        print("Bai 4.2 So thu \(j+1) la \(fibonacci(n:j))")
    }
}
//let x:Int = 100
lietKe(x: 10)

// Bai 4.3 Tinh sin(x) cos(x) bang chuoi taylor
public func sincostaylor(x: Float, n: Int) -> Float {
    var a:Int
    if n % 2 == 0 {
        a = 1
    }else{
        a = -1
    }
    var temp: Float = 1;
    for i in 1...(2 * n + 1){
        temp = temp *  x / Float(i)
    }
    return Float(a)*temp
}
// tinh sinx
func tinhSinxCosX(){
let x: Float = 6 //radian nhap x
var n: Int = 0
var sin: Float = 0

while (abs(sincostaylor(x: x, n: n))>0.00001) {
    sin += sincostaylor(x: x, n: n)
    n = n + 1
}
print("Bai 4.3 Sin: \(sin)")
// tinh cosx
print("Bai 4.3, Cos \(sqrt(1 - sin * sin))")
}
tinhSinxCosX()

// Bai 4.4 Liet ke so hanh phuc be hon 10.000
public func tongBinhPhuong(n: Int) -> Int{
    var x: Int = 0
    var n1: Int
    n1 = n
    while n1 != 0 {
        x += (n1 % 10) * (n1 % 10)
        n1 /= 10
    }
    return x
}
public func soHanhPhuc(n: Int) ->Bool{
    if n == 1 {
        return true
    }
    var h: Int = n
    var array: [Int] = []
    while h > 1 && !array.contains(h) {
        array.append(h)
        h = tongBinhPhuong(n: h)
    }
    return h == 1
}
//lietke so hanh phuc < 10.000
func lietke(){
    for i in 1...10000{
        if soHanhPhuc(n: i)==true {
            print("Bai 4.4 So HP: \(i)")
        }
    }
}
lietke()
