import UIKit

class HinhVe{
    var ten :String

    init(ten:String) {
        self.ten = ten
    }
    func DienTich()->String{
        return " DienTich "
    }
    func ChuVi()->String{
        return "ChuVi"
    }
    func TheTich()->String{
        return "TheTich"
    }
    func PhuongThucKhac()-> String{
        return "Phuong thuc khac"
    }
}

class HaiChieu :HinhVe {
    override func ChuVi() -> String {
        return " Chu vi hinh hai chieu"
    }
    override func DienTich() -> String {
        return "Dien tich hinh hai chieu "
    }
}

class BaChieu :HinhVe {
    override func ChuVi() ->String{
        return "Chu vi hinh ba chieu "
    }
    override func DienTich() -> String {
        return "Dien tich hinh ba chieu"
    }
    override func TheTich() -> String {
        return "The tich hinh ba chieu "
    }
    
}

var hinhTron = HaiChieu.init(ten: "HinhTron")
hinhTron.ChuVi()
hinhTron.DienTich()
var hinhVuong = HaiChieu.init(ten: "HinhVuong")
hinhVuong.ChuVi()
hinhVuong.DienTich()
var tamGiac = HaiChieu.init(ten: "TamGiac")
tamGiac.ChuVi()
tamGiac.DienTich()
var Cau = BaChieu.init(ten: "BaChieu")
Cau.ChuVi()
Cau.DienTich()
Cau.TheTich()
var LapPhuong = BaChieu.init(ten: "LapPhuong")
LapPhuong.ChuVi()
LapPhuong.DienTich()
LapPhuong.TheTich()
