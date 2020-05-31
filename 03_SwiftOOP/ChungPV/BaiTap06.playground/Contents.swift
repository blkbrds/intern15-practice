//import UIKit
import Foundation
class HinhVe{
    var chuVi: Double = 0.0
    var dienTich:Double = 0.0
    var theTich:Double = 0.0
    var ten:String = ""
    func inChuVi() {
        print("Chu vi \(ten) = \(chuVi)")
    }
    
    func inDienTich() {
        print("Dien tich \(ten) = \(dienTich)")
    }
    
    func inTheTich() {
        print("The Tich \(ten)= \(theTich)")
    }
    
    func tinhChuvi() ->Double{
        return chuVi
    }
    
    func tinhDienTich() -> Double {
        return dienTich
    }
    
    func tinhTheTich() -> Double {
        return theTich
    }
}
class HaiChieu: HinhVe{
    
}
class BaChieu: HinhVe {
    
}
class HinhTron: HaiChieu {
    var banKinh: Double
    init(banKinh: Double) {
        self.banKinh = banKinh
    }
    
    func tenhinhTron() -> String {
        ten = "Hinh Tron"
        return ten
    }
    
    override func tinhChuvi() -> Double {
       chuVi = 2 * 3.14 * banKinh
        return chuVi
    }
    
    override func tinhDienTich()-> Double{
        dienTich = 2 * banKinh * banKinh
        return dienTich
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
        //super.init(ten: String)
    }
    func tenhinhTamGiac() -> String {
        ten = "Hinh Tam Giac"
        return ten
    }
    
    override func tinhChuvi() -> Double {
         chuVi = Double(canhA + canhB + canhC)
        return chuVi
    }
    
    override func tinhDienTich() -> Double {
        let p = tinhChuvi()/2
         dienTich = sqrt(p * (p - canhA) * (p - canhB) * (p - canhC))
        return dienTich
    }
}
class HinhVuong: HaiChieu {
    var canh: Double
    init(canh: Double) {
        self.canh = canh
        
    }
    
    func tenhinhVuong() -> String {
        ten = "Hinh Vuong"
        return ten
    }
    
    override func tinhChuvi() -> Double {
        chuVi = 4.0 * canh
        return chuVi
    }
    
    override func tinhDienTich() -> Double {
        chuVi = canh * canh
        return chuVi
    }
    
}
class HinhCau: BaChieu {
    var banKinh: Double
    
    init(banKinh: Double) {
        self.banKinh = banKinh
        //super.init(ten: String)
    }
    
    func tenhinhCau() -> String {
        ten = "Hinh Cau"
        return ten
    }
    
    override func tinhDienTich() -> Double {
        dienTich = 4 * 3.14 * banKinh * banKinh
        return dienTich
    }
    
    override func tinhTheTich() -> Double {
        theTich = (4 / 3) * 3.14 * pow(banKinh, 3)
        return theTich
    }
}
class HinhLapPhuong: BaChieu {
    var canh: Double
    
    init(canh: Double) {
        self.canh = canh
        //super.init(ten: String)
    }
    
    func tenhinhLapPhuong() -> String {
        ten = "Hinh Lap Phuong"
        return ten
    }
    
    override func tinhDienTich() -> Double {
        dienTich = 6 * canh * canh
        return dienTich
    }
    
    override func tinhTheTich() -> Double {
        theTich = pow(canh, 3)
        return theTich
    }
}
// Call các hình nè

var hinhVe = HinhVe()
// Hinh Tron

var hinhTron = HinhTron(banKinh: 3)
hinhTron.tenhinhTron()
hinhTron.tinhDienTich()
hinhTron.tinhChuvi()
hinhTron.inChuVi()
hinhTron.inDienTich()

// Hinh Vuong
var hinhVuong = HinhVuong(canh: 4)
hinhVuong.tenhinhVuong()
hinhVuong.tinhDienTich()
hinhVuong.tinhChuvi()
hinhVuong.inChuVi()
hinhVuong.inDienTich()

// Hinh Tam Giac
var hinhTG = HinhTamGiac(canhA: 3, canhB: 4, canhC: 5)
hinhTG.tenhinhTamGiac()
hinhTG.tinhDienTich()
hinhTG.tinhChuvi()
hinhTG.inChuVi()
hinhTG.inDienTich()

// Hinh Cau
var hinhCau = HinhCau(banKinh: 4)
hinhCau.tenhinhCau()
hinhCau.tinhDienTich()
hinhCau.tinhTheTich()
hinhCau.inDienTich()
hinhCau.inTheTich()

// Hinh Lap Phuong
var hinhLP = HinhLapPhuong(canh: 5)
hinhLP.tenhinhLapPhuong()
hinhLP.tinhDienTich()
hinhLP.tinhTheTich()
hinhLP.inTheTich()
hinhLP.inDienTich()
