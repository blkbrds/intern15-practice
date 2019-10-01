import UIKit

// tinh dien tich va the tich hinh cau
func hinhcau(bankinh: Double) -> (Double,Double) {
  return (.pi*4*bankinh*bankinh*bankinh/3,.pi*4*bankinh*bankinh)
}

// in ra 50 si fibonacci dau tien va tinh tong
func soFibo() {
  var a = Array(repeating: 1, count: 50)
  var s = 0
  for i in 0..<50{
    if i > 1 {
      a[i] = a[i - 2] + a[i - 1]
    }
    s = s + a[i]
    print(a[i])
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

var n = 0
var sinX: Float = 0
while abs(sinn(x: 0.5235, n: n)) > 0.0000001 {
  sinX = sinX + sinn(x: 0.5235, n: n)
  n = n + 1
}

//print(sinX)

 //diem so lan xuat hien cua chuoi con
func tachchuoi(chuoiMe: String, chuoiCon: String) -> Int{
  var a = chuoiMe
  var count = 0
  while chuoiCon.count < a.count {
    count = a.hasPrefix(chuoiCon) ? count + 1 : count
    a.removeFirst(1)
  }
  return count
}
print(tachchuoi(chuoiMe: "abcaabbbabbbaac", chuoiCon: "ab"))

//random so thu tu trong mang
func randomElement<T>(array: [T]) -> [T]{
  var numberRandom = Int.random(in: 0..<array.count)
  var previousRandom = [Int]()
  var temp = array

  array.forEach {
    while previousRandom.contains(numberRandom) {
      numberRandom = Int.random(in: 0..<array.count)
    }
    temp[numberRandom] = $0
    previousRandom.append(numberRandom)
  }
  return temp
}

var abc = [0,1,2,1,1,3,4,5,6,7,8,9]
print(randomElement(array: abc))

// thay the 1 so trong mang
func bearrayReplace<T: Comparable>(inputArray: [T], elemToReplace: T,substitutionElem: T) -> [T] {
  var temp = inputArray
  for i in 0..<temp.count {
    temp[i] = temp[i] == elemToReplace ? substitutionElem : temp[i]
  }
  return temp
}

bearrayReplace(inputArray: abc, elemToReplace: 1, substitutionElem: 10)


