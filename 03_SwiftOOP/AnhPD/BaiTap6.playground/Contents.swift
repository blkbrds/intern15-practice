import UIKit

class HinhVe {
    var giaTriCacCanh: [Int]
    var soCanh: Int
    
    init(giaTriCacCanh: [Int], soCanh: Int) {
        self.giaTriCacCanh = giaTriCacCanh
        self.soCanh = soCanh
    }
    
    func tinhChuVi() -> Int {
        return 0
    }
    
    func tinhDienTich() -> Double {
        return 0
    }
}

class HaiChieu : HinhVe {
    
}

class BaChieu : HinhVe {
    func tinhTheTich() -> Double {
        return 0
    }
}
//Tam giac
class TamGiac: HaiChieu {
    var a: Int
    var b: Int
    var c: Int
    
    init(a: Int, b: Int, c: Int) {
        self.a = a
        self.b = b
        self.c = c
        super.init(giaTriCacCanh: [a, b, c], soCanh: 3)
    }
    
    override func tinhChuVi() -> Int {
        super.tinhChuVi()
        var chuVi: Int = 0
        for i in 0..<soCanh {
            chuVi = chuVi + giaTriCacCanh[i]
        }
        return chuVi
    }
    
    override func tinhDienTich() -> Double {
        super.tinhDienTich()
        var s: Double = 0
        let p: Double = Double(tinhChuVi())
        s = sqrt(p * (p - Double(a)) * (p - Double(b)) * (p - Double(c)))
        return s
    }
}
var tg = TamGiac(a: 5, b: 3, c: 4)
print(tg.tinhChuVi())
print(tg.tinhDienTich())

//HinhVuong
class HinhVuong: HaiChieu {
    var a: Int
    
    init(a: Int) {
        self.a = a
        super.init(giaTriCacCanh: [a], soCanh: 4)
    }
    
    override func tinhChuVi() -> Int {
        super.tinhChuVi()
        var chuVi: Int = 0
        chuVi = a * soCanh
        return chuVi
    }
    
    override func tinhDienTich() -> Double {
        super.tinhDienTich()
        var s: Double = 0
        s = Double(a) * Double(a)
        return s
    }
}

var hv = HinhVuong(a: 3)
print(hv.tinhChuVi())
print(hv.tinhDienTich())

class HinhTron: HaiChieu {
    var r: Double
    init(r: Double) {
        self.r = r
        super.init(giaTriCacCanh: [], soCanh: 0)
    }
    override func tinhChuVi() -> Int {
        super.tinhChuVi()
        var chuVi: Double = 0
        chuVi = 2 * r * .pi
        return Int(chuVi)
    }
    override func tinhDienTich() -> Double {
        super.tinhDienTich()
        var s: Double = 0
        s = r * r * .pi
        return s
    }
}
var ht = HinhTron(r: 4)
print(ht.tinhChuVi())
print(ht.tinhDienTich())

class HinhCau: BaChieu {
    var r: Double
    
    init(r: Double) {
        self.r = r
        super.init(giaTriCacCanh: [], soCanh: 0)
    }
    
    override func tinhDienTich() -> Double {
        super.tinhTheTich()
        var s: Double = 0
        s = 4 * .pi * r * r
        return s
    }
    override func tinhTheTich() -> Double {
        super.tinhTheTich()
        var v: Double = 0
        v = 4 / 3 * (.pi * r * r * r)
        return v
    }
    
}
var hc = HinhCau(r: 3)
print(hc.tinhDienTich())
print(hc.tinhTheTich())
class HinhLapPhuong : BaChieu {
    var a: Int
    init(a: Int){
        self.a = a
        super.init(giaTriCacCanh: [], soCanh: 0)
    }
    override func tinhDienTich() -> Double {
        super.tinhTheTich()
        var s : Double = 0
        s = 6 * Double(a) * Double(a)
        return s
    }
    override func tinhTheTich() -> Double {
        super.tinhTheTich()
        var v: Double = 0
        v = Double(a) * 3
        return v
    }
}
var hlp = HinhLapPhuong(a: 3)
print(hlp.tinhDienTich())
print(hlp.tinhTheTich())
