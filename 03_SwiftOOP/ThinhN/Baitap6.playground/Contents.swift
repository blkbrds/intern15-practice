import UIKit

class HinhVe{
    let chuVi: Float = 0.0
    let dienTich: Float = 0.0

    func tinhDienTich(){
        print("Dien tich cua hinh la \(dienTich)")
    }
    
    func tinhChuVi(){
        print("Chu vi cua hinh la  \(chuVi)")
    }
}

class HaiChieu: HinhVe{

}
class BaChieu: HinhVe {
    var theTich: Float = 0.0
    
    func tinhTheTich(){
        print("The tich cua hinh la \(theTich)")
    }
}

final class hinhTron: HaiChieu{
    var banKinh: Float
    
    init(banKinh: Float){
        self.banKinh = banKinh

    }
    
   override func tinhChuVi() {
        let chuVi = 2 * banKinh * 3.14
        print("Chu vi hinh tron la \(chuVi)")
    }
    
    override func tinhDienTich() {
        let dienTich = banKinh * banKinh * 3.14
        print("Dien tich hinh tron la \(dienTich)")
    }
}
var tinhHinhTron = hinhTron(banKinh: 4)
tinhHinhTron.tinhChuVi()
tinhHinhTron.tinhDienTich()

final class hinhVuong: HaiChieu{
    var canh: Float
    
    init(canh: Float){
        self.canh = canh
    }
    
    override func tinhChuVi() {
        let chuVi = 4 * canh
        print("Chu vi hinh vuong la \(chuVi)")
    }
    
    override func tinhDienTich() {
        let dienTich = canh * canh
        print("Dien tich hinh vuong la \(dienTich)")
    }
}
var tinhHinhVuong = hinhVuong(canh: 4)
tinhHinhVuong.tinhChuVi()
tinhHinhVuong.tinhDienTich()

final class hinhTamGiac:HaiChieu{
    var canh1: Float
    var canh2: Float
    var canh3: Float
    
    init (canh1: Float, canh2: Float, canh3: Float){
        self.canh1 = canh1
        self.canh2 = canh2
        self.canh3 = canh3
    }
    
    override func tinhChuVi() {
        let chuVi = canh1 + canh2 + canh3
        print("Chu vi hinh tam giac la  \(chuVi)")
    }
    
    override func tinhDienTich() {
        let dienTich = sqrt((canh1 + canh2 + canh3) * (canh1 + canh2 - canh3) * (canh2 + canh3 - canh1) * (canh3 + canh1 - canh2)) / 4
        print("Dien tich hinh tam giac la  \(dienTich)")
    }
}
var tinhTamGiac = hinhTamGiac(canh1: 3, canh2: 4, canh3: 5)
tinhTamGiac.tinhChuVi()
tinhTamGiac.tinhDienTich()

final class hinhCau: BaChieu{
    var canh: Float
    
    init(canh: Float){
        self.canh = canh
    }
    override func tinhDienTich() {
        let dienTich = 4 * 3.14 * canh * canh * canh
        print("Dien tich mat cau la \(dienTich)")
    }
    
    override func tinhTheTich() {
        let theTich = (4 * 3.14 * canh * canh * canh) / 3
        print("The tich mat cau la \(theTich)")
    }
}
var tinhHinhCau = hinhCau(canh: 3)
tinhHinhCau.tinhDienTich()
tinhHinhCau.tinhTheTich()

final class lapPhuong: BaChieu{
    var  canh: Float
    
    init(canh: Float){
        self.canh = canh
    }
    override func tinhDienTich() {
        let dienTich = canh * canh * 6
        print("Dien tich hinh lap phuong la \(dienTich)")
    }
    
    override func tinhTheTich() {
        let theTich = canh * canh * canh
        print("The tich hinh lap phuong la \(theTich)")
    }
}
var tinhLapPhuong = lapPhuong(canh: 3)
tinhLapPhuong.tinhDienTich()
tinhLapPhuong.tinhTheTich()

