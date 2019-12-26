import Foundation

class Mang1c{
    var mang : [Int]
    
    init(mang: [Int]) {
        self.mang = mang
    }
    func inmang(){
        for i in 0..<mang.count{
            print(mang[i])
        }
    }
    func timMax()->Int{
        var max = 1
        for i in 0..<mang.count where mang[i] > max{
            max = mang[i]
        }
        return max
    }
    func timMin() -> Int{
        var min = 1
        for i in 0..<mang.count where mang[i] < min{
            min = mang[i]
        }
        return min
    }
}
var mang1 = Mang1c(mang: [1,3,5,4,7,8,6,10,-5])
mang1.inmang()
print(" max is : \(mang1.timMax())")
print(" min is : \(mang1.timMin())")
