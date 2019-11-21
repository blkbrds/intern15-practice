import UIKit

final class MangMotChieu {
    var mangMotChieu: [Int]

    init(mangMotChieu: [Int]) {
        self.mangMotChieu = mangMotChieu
    }

    func inMang() {
        for i in 0..<mangMotChieu.count {
            print(mangMotChieu[i])
        }
    }

    func phanTuLonNhat() -> Int {
        var max = mangMotChieu[0]
        for i in 0..<mangMotChieu.count where mangMotChieu[i] > max {
            max = mangMotChieu[i]
        }
        return max
    }

    func phanTuNhoNhat() -> Int {
        var min = mangMotChieu[0]
        for i in 0..<mangMotChieu.count where mangMotChieu[i] < min {
            min = mangMotChieu[i]
        }
        return min
    }
}

var mangMotChieu = MangMotChieu(mangMotChieu: [1, 3, 5, 7, 2, 4, 6, -19])
mangMotChieu.inMang()
print("Phan tu lon nhat trong mang: \(mangMotChieu.phanTuLonNhat())")
print("Phan tu nho nhat trong mang: \(mangMotChieu.phanTuNhoNhat())")
