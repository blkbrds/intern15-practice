import UIKit

class Mang1c {
    var arr: [Int]

    init(arr: [Int]) {
        self.arr = arr
    }

    func inMang() {
        print("\(arr)")
    }

    func inPhanTuLonNhat() {
        let arr: [Int] = self.arr
        var max: Int = arr[0]
        for i in 0..<arr.count {
            if max < arr[i] {
                max = arr[i]
            }
        }
        print("Phan tu lon nhat = \(max)")
    }

     func inPhanTuNhoNhat() {
        let arr: [Int] = self.arr
        var min: Int = arr[0]
        for i in 0..<arr.count {
            if min > arr[i] {
                min = arr[i]
            }
        }
        print("Phan tu nho nhat = \(min)")
    }
}
var mang = Mang1c(arr: [12,55,22,44,77,99,21])
mang.inMang()
mang.inPhanTuLonNhat()
mang.inPhanTuNhoNhat()
