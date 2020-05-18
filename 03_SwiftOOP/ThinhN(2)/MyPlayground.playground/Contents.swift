import UIKit

//Tạo lớp Người với các thuộc tính cơ bản như tên, ngày sinh, tuổi (tuổi được tính từ ngày sinh và ngày hiện tại), phương thức là hoạt động. Yêu cầu tạo 1 đối tượng thuộc lớp Người có tên là “Nguyễn Văn A”, ngày sinh là 1/1/1988. In ra tuổi của đối tương này
class Nguoi {
    var ten: String
    var ngaySinh: String
    var tuoi: Int {
        get {
            let ngay = ngaySinh.split(separator: "/")
            let nam = Int(String(ngay[2])) ?? 0
            return 2020 - nam
        }
    }
    init (ten: String, ngaySinh: String) {
        self.ten = ten
        self.ngaySinh = ngaySinh
    }
    
    func hoatDong() {
        print("Hoat dong ")
    }
}

class GiaoVien: Nguoi {
    var boMon: String
    init(ten: String, ngaySinh: String, boMon: String) {
        self.boMon = boMon
        super.init(ten: ten, ngaySinh: ngaySinh)
    }
    override func hoatDong() {
        print("Giang day")
    }
}

class HocSinh: Nguoi {
    var lop: String
    init(ten: String, ngaySinh: String, lop: String) {
        self.lop = lop
        super.init(ten: ten, ngaySinh: ngaySinh)
    }
    override func hoatDong() {
        print("Hoc tap ")
    }
}
var a = Nguoi(ten: "X", ngaySinh: "20/02/2002")
a.hoatDong()
a.tuoi
var b = GiaoVien(ten: "x2", ngaySinh: "20/02/2222", boMon: "Toan")
b.hoatDong()


