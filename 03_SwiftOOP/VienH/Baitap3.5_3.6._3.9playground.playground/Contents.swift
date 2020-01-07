import UIKit

final class CStack {

    // MARK: - Properties
    var array: [Int] = []
    let numberOfElements: Int

    // MARK: - Init
    init(numberOfElements: Int) {
        self.numberOfElements = numberOfElements
    }

    // MARK: - Public func
    func isStackFull() -> Bool {
        return array.count >= numberOfElements
    }

    func isStackEmpty() -> Bool {
        return array.isEmpty
    }

    func push(element: Int) {
        guard !isStackFull() else { return }
        array.append(element)
    }

    func pop() {
        guard !isStackEmpty() else { return }
        array.removeLast()
    }

    func printStack() {
        print(array)
    }

    func getMaxValue() -> Int {
        guard let max = array.max() else { return 0 }
        return max
    }

    func getMinValue() -> Int {
        guard let min = array.min() else { return 0 }
        return min
    }
}

class HinhVe {
    var ten: String

    init(ten: String) {
        self.ten = ten
    }

    func dienTich() -> Float {
        return 0
    }

    func chuVi() -> Float {
        return 0
    }

    func theTich() -> Float {
        return 0
    }
}

class HaiChieu: HinhVe { }

final class HinhTron: HaiChieu {
    private var banKinhR: Float = 0

    init(banKinh: Float, ten: String) {
        super.init(ten: ten)
        banKinhR = banKinh
    }

    override func dienTich() -> Float {
        super.dienTich()
        return .pi * banKinhR * banKinhR
    }

    override func chuVi() -> Float {
        super.chuVi()
        return .pi * 2 * banKinhR
    }
}

final class HinhVuong: HaiChieu {
    private var Canh: Float = 0

    init(Canh: Float, ten: String) {
        super.init(ten: ten)
        self.Canh = Canh
    }

    override func chuVi() -> Float {
        super.chuVi()
        return Canh * 4
    }

    override func dienTich() -> Float {
        super.dienTich()
        return Canh * Canh
    }
}

final class TamGiac: HaiChieu {
    private var chieuDai: Float = 0
    var chieuRong: Float = 0
    var chieuCao: Float = 0

    init(chieuDai: Float, chieuRong: Float, chieuCao: Float, ten: String) {
        super.init(ten: ten)
        self.chieuCao = chieuCao
        self.chieuDai = chieuDai
        self.chieuRong = chieuRong
    }

    override func chuVi() -> Float {
        super.chuVi()
        return chieuDai + chieuRong + chieuCao
    }

    override func dienTich() -> Float {
        super.dienTich()
        return chieuDai * chieuDai * sqrt(3) / 4
    }
}

var a: TamGiac = TamGiac(chieuDai: 1, chieuRong: 2, chieuCao: 3, ten: "hinh tam giac")
a.ten
a.chuVi()
a.dienTich()

var b: HinhVuong = HinhVuong(Canh: 4, ten: "HinhVuong")
b.ten
b.chuVi()
b.dienTich()

var c: HinhTron = HinhTron(banKinh: 10, ten: "HinhTron")
c.ten
c.chuVi()
c.dienTich()

