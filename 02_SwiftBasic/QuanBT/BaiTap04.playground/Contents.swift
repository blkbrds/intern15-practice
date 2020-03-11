import UIKit

func totalFibonacciNumber() -> Double{
    var sum: Double = 0
    var temp0: Double = 1, temp1: Double = 1, temp2: Double = temp0
    for _ in 0...10 {
        sum += temp0
        temp0 = temp1
        temp1 = temp1 + temp2
        temp2 = temp0
    }
    return sum
}
print(totalFibonacciNumber())


func listedFibonacciNumber() -> String{
    var str: String = String()
    var temp0 = 1, temp1 = 1, temp2 = temp0
    for _ in 0...10 {
        str += String(temp0) + " "
        temp0 = temp1
        temp1 = temp1 + temp2
        temp2 = temp0
    }
    return str
}
print(listedFibonacciNumber())


func factorial(n: Double) -> Double{
    if(n > 1) {
        return  n * factorial(n: n - 1)
    } else{
        return 1
    }
}

func getSinX(x: Double ,n: Int) -> Double{
    var result: Double = 0
    var temp: Double = 1
    
    for i in 0 ..< n {
        temp = (2 * Double(i) + 1)
        result += pow(-1,Double(i)) * pow(x, temp) / factorial(n: temp)
    }
    return result
}
print(getSinX(x: 0.4, n: 15))

func getCosX(y: Double) -> Double{
    let result = 1 - getSinX(x: y, n: 15) * getSinX(x: y, n: 15)
    return sqrt(result)
}
print(getCosX(y: 0.4))


func sumOfSpuares(n: Int) -> Int{
    var result = 0
    var temp = n
    while temp > 0 {
        result += (temp % 10) * (temp % 10)
        temp /= 10
    }
    return result
}
print(sumOfSpuares(n: 9865))

func isHappyNumbers(n: Int) -> Bool{
    var temp = n
    for _ in 0 ... 50 {
        temp = sumOfSpuares(n: temp)
    }
    if(temp == 1) {
        return  true
    }else{
        return false
    }
}
print(isHappyNumbers(n: 100))

func seriesOfHappyNumbers(){
    for item in 0 ... 100 {
        if(isHappyNumbers(n: item)){
            print(item)
        }
    }
}
seriesOfHappyNumbers()
