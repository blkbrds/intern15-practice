import UIKit

final class GamePitago {
    var n: Int
    var mangTamGiac: [(Int, Int, Int)]

    init(n: Int, mangTamGiac: [(Int, Int, Int)]) {
        self.n = n
        self.mangTamGiac = mangTamGiac
    }

    func ktPitago(tamGiac: (Int, Int, Int)) -> Bool {
        let a = Double(tamGiac.0)
        let b = Double(tamGiac.1)
        let c = Double(tamGiac.2)

        return pow(a, 2) + pow(b, 2) == pow(c, 2) ? true : (pow(a, 2) + pow(c, 2) == pow(b, 2) ? true : (pow(c, 2) + pow(b, 2) == pow(a, 2) ? true : false))
    }
    func mangTamGiacPitago() -> [(Int, Int, Int)] {
        var mangTamGiacPitago = [(Int, Int, Int)]()
        for i in 0..<mangTamGiac.count where ktPitago(tamGiac: mangTamGiac[i]) {
            mangTamGiacPitago.append(mangTamGiac[i])
        }
        return mangTamGiacPitago
    }
}

var newGame = GamePitago(n: 3, mangTamGiac: [(3, 4, 5), (1, 2, 3), (5, 12, 13)])

print("Mang tam giac Pitago la: \(newGame.mangTamGiacPitago())")
