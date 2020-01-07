import UIKit

final class HocSinh {
    var hoTen: String
    var namSinh: Int
    var tongDiem: Double

    init(hoTen: String, namSinh: Int, tongDiem: Double) {
        self.hoTen = hoTen.inHoaChuCaiDau()
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }

    func toString() -> String {
        return "Ho Ten: \(hoTen),\t Nam Sinh: \(namSinh),\t Tong Diem: \(tongDiem)"
    }
}

extension String {
    func inHoaChuCaiDau() -> String {
        let hoTen: String = self
        var hoTenArray: [Character] = Array(hoTen)
        hoTenArray[0] = Character(hoTenArray[0].uppercased())
        for i in 1..<hoTenArray.count where hoTenArray[i - 1] == " " {
            hoTenArray[i] = Character(hoTenArray[i].uppercased())
        }
        return String(hoTenArray)
    }
}

extension Array where Element: HocSinh {
    func sapXepDanhSachHocSinh() -> [HocSinh] {
        var danhSachHocSinh: [HocSinh] = self
        danhSachHocSinh.sort { (hocSinhA, hocSinhB) -> Bool in
            if hocSinhA.tongDiem == hocSinhB.tongDiem {
                return hocSinhA.namSinh < hocSinhB.namSinh
            } else {
                return hocSinhA.tongDiem > hocSinhB.tongDiem
            }
        }
        return danhSachHocSinh
    }

    func inDanhSachHocSinh() {
        let danhSachHocSinh: [HocSinh] = self
        for i in 0..<danhSachHocSinh.count {
            print(danhSachHocSinh[i].toString())
        }
    }
}

var danhSachHocSinh: [HocSinh] = []
danhSachHocSinh.append(HocSinh(hoTen: "Hoang Vien", namSinh: 1997, tongDiem: 10.0))
danhSachHocSinh.append(HocSinh(hoTen: "Nguyen Hong Hanh", namSinh: 1957, tongDiem: 10.0))
danhSachHocSinh.append(HocSinh(hoTen: "Nguyen Thong", namSinh: 1937, tongDiem: 5.6))
danhSachHocSinh.append(HocSinh(hoTen: "Nguyen Phuoc", namSinh: 1997, tongDiem: 5.3))

print("Danh sach truoc khi sap xep")
danhSachHocSinh.inDanhSachHocSinh()
print("\nDanh sach da sap xep")
var danhSachHocSinhDaSapXep = danhSachHocSinh.sapXepDanhSachHocSinh()
danhSachHocSinhDaSapXep.inDanhSachHocSinh()



