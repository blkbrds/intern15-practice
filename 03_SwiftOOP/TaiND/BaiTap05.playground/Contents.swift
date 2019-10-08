import UIKit

class CStack {
    var arr: [Int] = []
    let soPhanTu: Int
    init(soPhanTu: Int) {
        self.soPhanTu = soPhanTu
    }
    func stackRong() -> Bool {
        return arr.isEmpty
    }
    func stackDay() -> Bool {
        return arr.count >= soPhanTu
    }
    func themStack(thanhPhan: Int) {
        guard stackDay() else { return }
        arr.append(thanhPhan)
    }
    func xoaStack() {
        guard stackRong() else { return }
        arr.removeLast()
    }
}
