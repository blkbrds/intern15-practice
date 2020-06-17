//import UIKit

class Mang1c{
    var mang:[Int]
    init(mang: [Int]) {
        self.mang = mang
    }
    func inMang() {
        for i in 0..<mang.count {
            print(mang[i])
        }
    }
    func inPhanTuLon(){
        var max = mang[0]
        for i in 0..<mang.count {
            if max < mang[i]{
                max = mang[i]
            }
        }
        print("So lon nhat: \(max)")
    }
    func inPhanTuBe() {
        var min = mang[0]
        for i in 0..<mang.count {
            if min > mang[i] {
                min = mang[i]
            }
        }
        print("So be nhat trong mang: \(min)")
    }
}
var mang = Mang1c(mang: [2,3,4,5,6])
mang.inMang()
mang.inPhanTuBe()
mang.inPhanTuLon()
