import UIKit

func replacesElements(input: Int, output: Int) {
    var arrays = [1, 2, 1]
    for i in 0 ..< arrays.count {
        if arrays[i] == input {
            arrays[i] = output
        }
    }
    print(arrays)
}
replacesElements(input: 1, output: 3)
