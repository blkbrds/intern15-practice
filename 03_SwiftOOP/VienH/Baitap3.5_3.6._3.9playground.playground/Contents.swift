import UIKit

// 3.5_3.9 Tao class ngan xep stack thuc hien kiem tra rong, day, them 1 phan tu, xoa 1 phan tu, so lon nhat, so nho nhat
class CSTack {
    // MARK: - Properties
    var arr: [Int] = []
    let numberElements: Int

    // MARK: - Init
    init(numberElements: Int) {
        self.numberElements = numberElements
    }

    // MARK: - Public func
    func isStackFull() -> Bool {
        return arr.count >= numberElements
    }

    func isStackEmpty() -> Bool {
        return arr.isEmpty
    }

    func push(element: Int) {
        guard !isStackFull() else { return }
        arr.append(element)
    }

    func pop() {
        guard !isStackEmpty() else { return }
        arr.removeLast()
    }

    func printStack() {
        print(arr)
    }

    func getMaxValue() -> Int {
        guard let max = arr.max() else { return 0 }
        return max
    }

    func getMinValue() -> Int {
        guard let min = arr.min() else { return 0 }
        return min
    }
}

// Bai Tap 3.6
import UIKit

class HinhVe {
    var ten: String

    init(ten: String) {
        self.ten = ten
    }

    func dienTich() -> Float {
        0
    }

    func chuVi() -> Float {
        return 0
    }

    func theTich() -> Float {
        return 0
    }
}

class HaiChieu: HinhVe { }

class HinhTron: HaiChieu {

    private var banKinhR: Float = 0

    init(banKinh: Float, ten: String) {
        super.init(ten: ten)
        banKinhR = banKinh
    }

    override func dienTich() -> Float {
        return .pi * banKinhR * banKinhR
    }

    override func chuVi() -> Float {
        return .pi * 2 * banKinhR
    }
}

class HinhVuong: HaiChieu {
    private var Canh: Float = 0

    init(Canh: Float, ten: String) {
        super.init(ten: ten)
        self.Canh = Canh
    }
    override func chuVi() -> Float {
        return Canh * 4
    }
    override func dienTich() -> Float {
        Canh * Canh
    }
}

class TamGiac: HaiChieu {
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
        return chieuDai + chieuRong + chieuCao
    }
    override func dienTich() -> Float {
        return chieuDai * chieuDai * sqrt(3) / 4
    }
}
var a: TamGiac = TamGiac (chieuDai: 1, chieuRong: 2, chieuCao: 3, ten: "hinh tam giac")
a.ten
a.chuVi()
a.dienTich()

var z: HinhVuong = HinhVuong (Canh: 4, ten: "HinhVuong")
z.ten
z.chuVi()
z.dienTich()

var x: HinhTron = HinhTron(banKinh: 10, ten: "HinhTron")
x.ten
x.chuVi()
x.dienTich()

