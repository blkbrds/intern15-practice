import UIKit

final class OneDimensionalArray {
    var arrays: [Int]
    
    init(arrays:[Int]) {
        self.arrays = arrays
    }
    
    func printInfo() {
        for item in self.arrays {
            print(item)
        }
    }
    
    func minMaxArray() {
        var min = self.arrays[0], max = self.arrays[0]
        for item in self.arrays {
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
var arrays: OneDimensionalArray = OneDimensionalArray(arrays: [4,2,5,6,7,1,2,3,5,7,8,9,10])
arrays.printInfo()
arrays.minMaxArray()

