import UIKit
func randomElement<T>(array: [T]) -> [T]{
 return array.shuffled()
}
var abc = [0,1,2,1,1,3,4,5,6,7,8,9]
print("các phần tử được hoán vị ngẫu nhiên la đây ", randomElement(array: abc))
