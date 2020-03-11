import UIKit

func totalFibonacciNumber() -> Double{
    var s : Double = 0
    var s0 : Double = 1, s1: Double = 1  , t : Double = s0
    for _ in 0...10 {
        s = s + s0
        s0 = s1
        s1 = s1 + t
        t = s0
    }
    return s
}
print(totalFibonacciNumber())


func listedFibonacciNumber() -> String{
    var s :String = String()
    var s0  = 1 , s1 = 1  , t = s0
    for _ in 0...10 {
        s = s + String(s0) + " "
        s0 = s1
        s1 = s1 + t
        t = s0
    }
 return s
}
print(listedFibonacciNumber())


func factorial(_ n: Double) -> Double{
    if(n > 1){
       return  n * factorial(n - 1)
    }else{
        return 1
    }
}

func sinX(x: Double , n: Int) -> Double{
  var s: Double = 0
  var a: Double = 1
  let t: Double = -1
   
  for i in 0 ..< n{
    a = (2 * Double(i) + 1)
    s = s + pow(t,Double(i)) * pow(x, a) / factorial(a)
  }
  return s
}
print(sinX(x: 0.4, n: 15))

func cosX(y: Double) -> Double{
    let s = 1 - sinX(x: y, n: 15) * sinX(x: y, n: 15)
    return sqrt(s)
}
print(cosX(y: 0.4))


func sumOfSpuares(_ n: Int) -> Int{
    var s = 0
    var m = n
    while m > 0 {
        s = s + (m % 10) * (m % 10)
        m = m / 10
    }
    return s
}
print(sumOfSpuares(9865))

func isHappyNumbers(_ n: Int) -> Bool{
    var s = n
        for _ in 0 ... 100 {
         s = sumOfSpuares(s)
        }
    if( s == 1){
        return  true
    }else{
        return false
    }
}
print(isHappyNumbers(100))

func seriesOfHappyNumbers(){
    for item in 0 ... 100 {
        if(isHappyNumbers(item)){
            print(item)
        }
    }
}
seriesOfHappyNumbers()
