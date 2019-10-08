import UIKit

class HinhVe {
    var chuVi: Float = 0
    var dienTich: Float = 0

}
class HaiChieu: HinhVe {

}
class BaChieu: HinhVe {
    var theTich: Float = 0
}

class HinhTron: HaiChieu {
    var banKinh: Float
    init(banKinh: Float) {
        self.banKinh = banKinh
        super.init()
        self.chuVi = .pi * 2 * banKinh
        self.dienTich = .pi * banKinh * banKinh
        print("Chu vi hinh tron la: ", chuVi)
        print("Dien tich hinh tron la: ", dienTich)
    }
}

class HinhVuong: HaiChieu {
    var canh: Float
    init(canh: Float) {
        self.canh = canh
        super.init()
        self.chuVi = canh * 4
        self.dienTich = canh * canh
        print("Chu vi cua hinh vuong la: ", chuVi)
        print("Dien tich cua hinh vuong la: ", dienTich)
    }
}

class TamGiac: HaiChieu {
    var canha, canhb, canhc: Float
    init(canha: Float, canhb: Float, canhc: Float) {
        self.canha = canha
        self.canhb = canhb
        self.canhc = canhc
        super.init()
        self.chuVi = canha + canhb + canhc
        self.dienTich = sqrt(chuVi * (chuVi / 2 - canha) * (chuVi / 2 - canhb) * (chuVi / 2 - canhc))
        print("Chu vi tam giac la: ", chuVi)
        print("Dien tich tam giac la: ", dienTich)
    }
}

class HinhCau: BaChieu {
    var bankinh: Float
    init(bankinh: Float) {
        self.bankinh = bankinh
        super.init()
        self.dienTich = 4 * .pi * bankinh
        self.theTich = dienTich * bankinh / 3
        print("Dien tich hinh cau la: ", dienTich)
        print("The tich hinh cau la: ", theTich)
    }
}

class LapPhuong: BaChieu {
    var chieuDai: Float
    init(chieuDai: Float) {
        self.chieuDai = chieuDai
        super.init()
        self.dienTich = 6 * chieuDai * chieuDai
        self.theTich = chieuDai * chieuDai * chieuDai
        print("Dien tich cua hinh lap phuong la:", dienTich)
        print("The tich cua hinh lap phuong la:", theTich)
    }
}
HinhTron.init(banKinh: 5)
HinhVuong.init(canh: 4)
TamGiac.init(canha: 3, canhb: 4, canhc: 5)
HinhCau.init(bankinh: 4)
LapPhuong.init(chieuDai: 5)
