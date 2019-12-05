import UIKit

func replaceTheElementsOfArray(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var copiedArray = inputArray
    for i in 0...inputArray.count - 1 {
        if(inputArray[i] == elemToReplace) {
            copiedArray[i] = inputArray[i]
            copiedArray[i] = substitutionElem
        }
    }
    return copiedArray
}

let inputArray = [2, 5, 2, 4, 2, 2, 2, 3, 5]
let elemToReplace = 2
let substitutionElem = 10
print(replaceTheElementsOfArray(inputArray: inputArray, elemToReplace: elemToReplace, substitutionElem: substitutionElem))
