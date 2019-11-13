import UIKit

func soChuoiCon(chuoiMe: String, chuoiCon: String) -> Int {
    var dem = 0
    let arrayA: [Character] = Array(chuoiMe)
    let arrayB: [Character] = Array(chuoiCon)
    for i in 0...arrayA.count - arrayB.count where [Character](arrayA[i..<(i + arrayB.count)]) == arrayB {
        dem = dem + 1
    }
    return dem
}

soChuoiCon(chuoiMe: "abaaaabbbabababbaaabababa", chuoiCon: "ab")
