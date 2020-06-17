//import UIKit
import Foundation
class TamGiac{
    var mangTg: [(Int, Int, Int)]
    init(mangTg:[(Int, Int, Int)] ) {
        self.mangTg = mangTg
    }
    func checkPitago(mangTg: (Int, Int, Int)) -> Bool {
        let canhA = Double(mangTg.0)
        let canhB = Double(mangTg.1)
        let canhC = Double(mangTg.2)
        if (canhA * canhA) + (canhB * canhB) == (canhC * canhC) || (canhA * canhA) + (canhC * canhC) == (canhB * canhB) || (canhB * canhB) + (canhC * canhC) == (canhA * canhA) {
            return true
        } else {
            return false
        }
    }
    func isTamGiacPitago() -> [(Int,Int,Int)]{
        var mangTgPitago = [(Int, Int, Int)]()
        for i in 0...mangTg.count - 1 {
            if checkPitago(mangTg: mangTg[i]) == true {
                mangTgPitago.append(mangTg[i])
            }
        }
        return mangTgPitago
    }
}
var tamGiac = TamGiac(mangTg: [(3, 4, 5),(5,6,7),(8,9,10),(5,12,13)])
print("Cac canh cua tam giac Pitago la: \(tamGiac.isTamGiacPitago())")
