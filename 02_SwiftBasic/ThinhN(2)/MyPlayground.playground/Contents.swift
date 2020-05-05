import UIKit

func tinhTong(n: Int) {
    var S: Float = 0
    for i in 1...n {
        S = sqrt(Float(n - (n - i)) + S)
    }
    print(S)
}
tinhTong(n: 3)

