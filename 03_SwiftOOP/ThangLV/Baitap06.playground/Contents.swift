import UIKit

class HinhVe {
    var chuVi: Double = 0
    var dienTich: Double = 0
}

class HaiChieu: HinhVe {
    
}

class HinhTron: HaiChieu {
    var banKinh: Double
    init(banKinh: Double) {
        self.banKinh = banKinh
        super.init()
        self.chuVi = 2 * .pi * banKinh
        self.dienTich = .pi * banKinh * banKinh
    }
}

class HinhVuong: HaiChieu {
    var canh: Double
    init(canh: Double) {
        self.canh = canh
        super.init()
        self.chuVi = 4 * canh
        self.dienTich = canh * canh
    }
}

class HinhTamGiac: HaiChieu {
    var canhA: Double
    var canhB: Double
    var canhC: Double
    
    init(canhA: Double, canhB: Double, canhC: Double) {
        self.canhA = canhA
        self.canhB = canhB
        self.canhC = canhC
        super.init()
        self.chuVi = canhA + canhB + canhC
    }
}

class BaChieu: HinhVe {
    var theTich: Double = 0
}

class HinhCau: BaChieu {
    var banKinh: Double
    init(banKinh: Double) {
        self.banKinh = banKinh
        super.init()
        self.theTich = (4 / 3) * .pi * banKinh * banKinh * banKinh
    }
}

class HinhLapPhuong: BaChieu {
    var canh: Double
    init(canh: Double) {
        self.canh = canh
        super.init()
        self.theTich = canh * canh * canh
    }
}

let hinhTron: HinhTron = HinhTron(banKinh: 2.5)
print(hinhTron.chuVi)
print(hinhTron.dienTich)
let hinhVuong: HinhVuong = HinhVuong(canh: 3)
print(hinhVuong.chuVi)
print(hinhVuong.dienTich)
let hinhTamGiac: HinhTamGiac = HinhTamGiac(canhA: 3, canhB: 4, canhC: 5)
print(hinhTamGiac.chuVi)
let hinhCau: HinhCau = HinhCau(banKinh: 2)
print(hinhCau.theTich)
let hinhLapPhuong: HinhLapPhuong = HinhLapPhuong(canh: 3)
print(hinhLapPhuong.theTich)
