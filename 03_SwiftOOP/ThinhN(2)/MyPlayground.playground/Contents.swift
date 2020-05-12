import UIKit

//Tạo lớp Người với các thuộc tính cơ bản như tên, ngày sinh, tuổi (tuổi được tính từ ngày sinh và ngày hiện tại), phương thức là hoạt động. Yêu cầu tạo 1 đối tượng thuộc lớp Người có tên là “Nguyễn Văn A”, ngày sinh là 1/1/1988. In ra tuổi của đối tương này
class Nguoi {
    var ten: String
    var ngayThangNamSinh: String
    init(ten: String, ngaySinh: Int,thangSinh: Int,namSinh: Int) {
        self.ten = ten
        self.ngayThangNamSinh = "\(ngaySinh)/\(thangSinh)/\(namSinh)"
    }
    func tinhTuoi() -> Int {
        var mang = [Character](ngayThangNamSinh)
        var namHienTai: Int = 2020
        var index: Int = 0
        var mangTam: [Character] = []
        for i in 0..<mang.count - 1 {
            if mang[i] == "/" {
                index = i
            }
        }
        for i in index + 1..<mang.count  {
            mangTam.append(mang[i])
        }
        for item in mang{
            mang.append(item)
        }
        let nam = Int(String(mangTam)) ?? 0
         namHienTai = namHienTai - nam
        return namHienTai
    }
}
let tuoi = Nguoi(ten: "Tran Van A", ngaySinh: 20, thangSinh: 2, namSinh: 2002)
tuoi.tinhTuoi()
