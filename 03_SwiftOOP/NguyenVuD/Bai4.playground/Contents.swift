import Foundation

class TimTamGiacVuong {
    var mangA: [(Int,Int,Int)]
    
    init(mangA: [(Int,Int,Int)]) {
        self.mangA = mangA
    }
    
    func timPytago(tamgiac: (Int,Int,Int)) -> Int {
        let canha = Double(tamgiac.0)
        let canhb = Double(tamgiac.1)
        let canhc = Double(tamgiac.2)
        if pow(canha, 2) + pow(canhb, 2) == pow(canhc, 2) || pow(canhb, 2) + pow(canhc, 2) == pow(canha, 2) || pow(canha, 2) + pow(canhc, 2) == pow(canhb, 2){
            return 1
        } else {
            return 0
        }
    }
    func mangTamGiac() -> [(Int, Int, Int)] {
        var mangtg = [(Int, Int, Int)]()
        for i in 0...mangA.count-1{
            if(timPytago(tamgiac: mangA[i]) == 1){
                mangtg.append(mangA[i])
            }
        }
        return mangtg
    }
}
var mangTamGiacA = TimTamGiacVuong(mangA: [(1, 2, 3), (2, 3, 4), (3, 4, 5)])
print(mangTamGiacA.mangTamGiac())
