import UIKit

final class OneDimensionalArray {
    var arr: [Int]
    
    init(arr:[Int]) {
        self.arr = arr
    }
    
    func printInfo() {
        for item in self.arr {
            print(item)
        }
    }
    
    func minMaxArray() {
        var min = self.arr[0], max = self.arr[0]
        for item in self.arr {
            if min > item {
                min = item
            }
            if max < item {
                max = item
            }
        }
        print("Số lớn nhất của mảng là: \(max)")
        print("Số nhỏ nhất của mảng là: \(min)")
    }
}
var arr: OneDimensionalArray = OneDimensionalArray(arr: [4,2,5,6,7,1,2,3,5,7,8,9,10])
arr.printInfo()
arr.minMaxArray()

