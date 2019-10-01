import UIKit

// tinh dien tich va the tich hinh cau
func hinhcau(bankinh: Double) -> (Double,Double) {
  return (.pi*4*bankinh*bankinh*bankinh/3,.pi*4*bankinh*bankinh)
}

// in ra 50 si fibonacci dau tien va tinh tong
func soFibo() {
  var a = 1
  var b = 1
  var fibo = 0
  var s = 0
  for _ in 0..<50{
    fibo = a + b
    a = b
    b = fibo
    s = s + fibo
    print(fibo)
  }
  print("Tong: \(s)")
}

// tinh sin bang day so Taylor
func sinn(x: Float, n: Int) -> Float{
  var temp: Float = 1
  for i in 1...2*n+1 {
    temp = temp * x / Float(i)
  }
  return n % 2 == 0 ? temp : -temp
}

func sinx(x: Float) -> Float{
  var n = 0
  var sinX: Float = 0
  while abs(sinn(x: x, n: n)) > 0.0000001 {
    sinX = sinX + sinn(x: x, n: n)
    n = n + 1
  }
  return sinX
}

//print(sinX)

//diem so lan xuat hien cua chuoi con
func demSoChuoiCon(str: String, str1: String) -> Int{
  var count = 0
  for i in 0...str.count - str1.count where str[str.index(str.startIndex, offsetBy: i)...str.index(str.startIndex, offsetBy: i + str1.count - 1)] == str1 {
    count = count + 1
  }
  
  return count
}
print(demSoChuoiCon(str: "abcababaaababb", str1: "aba"))

//random so thu tu trong mang
func randomElement<T>(array: [T]) -> [T]{
  return array.shuffled()
}

var abc = [0,1,2,1,1,3,4,5,6,7,8,9]
print(randomElement(array: abc))

// thay the 1 so trong mang
func bearrayReplace<T: Comparable>(inputArray: [T], elemToReplace: T,substitutionElem: T) -> [T] {
  var temp = inputArray
  for i in 0..<temp.count where temp[i] == elemToReplace{
    temp[i] = substitutionElem
  }
  return temp
}

bearrayReplace(inputArray: abc, elemToReplace: 1, substitutionElem: 10)


