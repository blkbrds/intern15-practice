import UIKit

//Tổng của 10 số Fibonacy đầu tiên
func fibonacci(n: Int) -> Int {
  var a = 1
  var b = 1
  var next = 0
  for i in 0..<n {
    if i <= 1 {
      next = i
    } else {
      next = a + b
      a = b
      b = next
    }
  }
  return next
}

func tinhTong(n: Int) -> Int {
  var tong = 0
  for i in 0..<n {
    tong += fibonacci(n: i)
  }
  return tong
}

let tongFi = tinhTong(n: 10)
print("Tong 10 so Fibonacci dau tien la: \(tongFi)")

//Liệt kê 10 số Fibonacy đầu tiên
func lietKe(n: Int){
  for i in 0..<n {
    let fi = fibonacci(n: i)
    print("F(\(i)) = \(fi)")
  }
}
lietKe(n: 10)

//Tính sin(x), cos(x) bằng công thức Chuỗi Taylor
func giaiThua(n: Int) -> Int{
    if n == 0 || n == 1 {
        return 1
    } else {
        return n * giaiThua(n: n - 1)
    }
}

func sinx(goc: Double) -> Double{
    let saiso = 0.00001
    var tinhtoan = 1.0
    var n = 0
    var sinx = 0.0
    let gocRad = goc * .pi / 180
    while tinhtoan > saiso {
        tinhtoan = pow(gocRad, Double((2 * n + 1))) / Double(giaiThua(n: 2 * n + 1))
        if n % 2 == 0 {
            sinx += tinhtoan
        } else {
            sinx -= tinhtoan
        }
        n += 1
    }
    return sinx
}

func cosx(goc: Double) -> Double{
    let saiso = 0.00001
    var tinhtoan = 1.0
    var n = 0
    var cosx = 0.0
    let gocRad = goc * .pi / 180
    while tinhtoan > saiso {
        tinhtoan = pow(gocRad, Double((2 * n))) / Double(giaiThua(n: 2 * n))
        if n % 2 == 0 {
            cosx += tinhtoan
        } else {
            cosx -= tinhtoan
        }
        n += 1
    }
    return cosx
}
print("\nSin(90) = \(sinx(goc: 90))")
print("\nCos(45) = \(cosx(goc: 45))")

/*Liệt kê các số hạnh phúc bé hơn 10.000 : Số hạnh phúc là số https://en.wikipedia.org/wiki/Happy_number */
func ktSoHanhPhuc(so: Int) -> Bool{
    if so == 1 {
        return true
    }
    var hanhPhuc = so
    if hanhPhuc < 10 {
        hanhPhuc = hanhPhuc * hanhPhuc
    }
    
    return false
}

print(ktSoHanhPhuc(so: 5))
