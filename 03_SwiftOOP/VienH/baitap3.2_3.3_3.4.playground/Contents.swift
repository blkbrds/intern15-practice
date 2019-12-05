import UIKit
//baitap01

class DaGiac {
    let soCanh: Int
    var giaTriCuaCanh: [Int]
    init?(soCanh: Int, giaTriCuaCanh: [Int]) {
        guard soCanh > 0 else { return nil }
        self.soCanh = soCanh
        guard giaTriCuaCanh.count >= soCanh else { return nil }
        self.giaTriCuaCanh = Array(giaTriCuaCanh[0..<soCanh])
    }
    func inCacCanh() {
        self.giaTriCuaCanh.forEach { print($0) }
    }
    func chuVi() -> Int {
        return self.giaTriCuaCanh.reduce(0) { $0 + $1 }
    }
}
//baitap03
class TamGiac: DaGiac {
    init?(giaTriCuaCanh: [Int]) {
        guard giaTriCuaCanh.count == 3 else { return nil }
        super.init(soCanh: 3, giaTriCuaCanh: giaTriCuaCanh)
    }
    override func chuVi() -> Int {
        super.chuVi()
    }
    func dienTich() -> Double {
        let p = Double(chuVi()) / 2
        return sqrt(p * (p - Double(giaTriCuaCanh[0])) * (p - Double(giaTriCuaCanh[1])) * (p - Double(giaTriCuaCanh[2])))
    }
}
//baiTap04
func ktTamGiacPytago(tamgiac: TamGiac) -> Bool {
    if tamgiac.giaTriCuaCanh[0] * tamgiac.giaTriCuaCanh[0] + tamgiac.giaTriCuaCanh[1] * tamgiac.giaTriCuaCanh[1] == tamgiac.giaTriCuaCanh[2] * tamgiac.giaTriCuaCanh[2] ||
        tamgiac.giaTriCuaCanh[0] * tamgiac.giaTriCuaCanh[0] + tamgiac.giaTriCuaCanh[2] * tamgiac.giaTriCuaCanh[2] == tamgiac.giaTriCuaCanh[1] * tamgiac.giaTriCuaCanh[1] ||
        tamgiac.giaTriCuaCanh[2] * tamgiac.giaTriCuaCanh[2] + tamgiac.giaTriCuaCanh[1] * tamgiac.giaTriCuaCanh[1] == tamgiac.giaTriCuaCanh[0] * tamgiac.giaTriCuaCanh[0] {
        return true
    }
    return false
}
func tamGiacPytago(in tamgiacs: [TamGiac]) {
    for tamgiac in tamgiacs where ktTamGiacPytago(tamgiac: tamgiac) {
        print(tamgiac.giaTriCuaCanh)
    }
}
let dagiac = DaGiac(soCanh: 3, giaTriCuaCanh: [1, 2, 3, 4])
dagiac?.chuVi()
