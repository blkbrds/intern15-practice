import Foundation
class HinhVe {
    var dientich:Float = 0

    func tinhDienTich() -> Float {
        return dientich
    }
}
class HaiChieu: HinhVe {
    var chuvi:Float = 0

    func tinhChuVi() -> Float {
        return chuvi
    }
}
class BaChieu: HinhVe {
    var thetich:Float = 0

    func tinhTheTich() -> Float {
        return thetich
    }
}
class Tron: HaiChieu{
    var r: Float

    init(r: Float){
        self.r = r
    }

    override func tinhChuVi() -> Float {
        chuvi = 2 * r * .pi
        return chuvi
    }

    override func tinhDienTich() -> Float {
        dientich = pow(r, 2) * .pi
        return dientich
    }
}
class Vuong: HaiChieu {
    var canh: Float
    
    init(canh: Float) {
        self.canh = canh
    }
    
    override func tinhChuVi() -> Float {
        chuvi = canh * 4
        return chuvi
    }
    
    override func tinhDienTich() -> Float {
        dientich = canh * canh
        return dientich
    }
}
class TamGiac: HaiChieu {
    var canha: Float
    var canhb: Float
    var canhc: Float
    
    init(canha: Float, canhb: Float, canhc: Float) {
        self.canha = canha
        self.canhb = canhb
        self.canhc = canhc
    }
    
    override func tinhChuVi() -> Float {
        chuvi = canha + canhb + canhc
        return chuvi
    }
    
    override func tinhDienTich() -> Float {
        let p = tinhChuVi()/2
        dientich = sqrt(p * (p - canha) * (p - canhb) * (p - canhc))
        return dientich
    }
}
class  Cau: BaChieu {
    var r: Float
    
    init(r: Float){
        self.r = r
    }
    
    override func tinhDienTich() -> Float {
        dientich = 4 * .pi * pow(r, 2)
        return dientich
    }
    
    override func tinhTheTich() -> Float {
        thetich = 4 / 3 * .pi * pow(r, 3)
        return thetich
    }
}
class LapPhuong: BaChieu {
    var canh: Float
    
    init(canh: Float){
        self.canh = canh
    }
    
    override func tinhDienTich() -> Float {
        dientich = pow(canh, 2) * 4
        return dientich
    }
    
    func tinhDienTichToanPhan() -> Float {
        dientich = pow(canh, 2) * 6
        return dientich
    }
    
    override func tinhTheTich() -> Float {
        thetich = pow(canh, 3)
        return thetich
    }
}

var hinhtron = Tron(r: 3)
var hinhvuong = Vuong(canh: 4)
var hinhtamgiac = TamGiac(canha: 2, canhb: 3, canhc: 4)
var hinhcau = Cau(r: 3)
var hinhlapphuong = LapPhuong(canh: 4)

print(hinhtron.tinhChuVi(),hinhtron.tinhDienTich())
