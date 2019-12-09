import UIKit

class Mang1c {
    var mangMotChieu: [Int] = []

    init(mangMotChieu: [Int]) {
        self.mangMotChieu = mangMotChieu
    }

    func inMang() {
        for i in 0..<self.mangMotChieu.count {
            print(self.mangMotChieu[i])
        }
    }

    func inPhanTuLonNhat() -> String {
        var max = self.mangMotChieu[0]
        for i in 1..<self.mangMotChieu.count {
            if(mangMotChieu[i] > max) {
                max = mangMotChieu[i]
            }
        }
        return "Phan tu lon nhat: \(max)"
    }

    func inPhanTuBeNhat() -> String {
        var min = self.mangMotChieu[0]
        for i in 1..<self.mangMotChieu.count {
            if(mangMotChieu[i] < min) {
                min = mangMotChieu[i]
            }
        }
        return "Phan tu be nhat: \(min)"
    }

}

let mangA: [Int] = [2, -9, 4, -5, 6, -71, 2, 100]
let mang: Mang1c = Mang1c(mangMotChieu: mangA)
mang.inMang()
print(mang.inPhanTuLonNhat())
print(mang.inPhanTuBeNhat())



