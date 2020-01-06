import UIKit

func bearrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    let outputArray = inputArray.map({ elem in
        elem == elemToReplace ? substitutionElem : elem
    })
    return outputArray
}

bearrayReplace(inputArray: [1, 1, 1, 2, 3, 4, 52, 1], elemToReplace: 1, substitutionElem: 5)
