import Foundation

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
        var danhsachhocsinh: [HocSinh] = self

        danhsachhocsinh.sort { (hocSinhA, hocSinhB) -> Bool in
            if hocSinhA.tongDiem == hocSinhB.tongDiem {
                return hocSinhA.namSinh < hocSinhB.namSinh
            } else {
                return hocSinhA.tongDiem > hocSinhB.tongDiem
            }
        }

        return danhsachhocsinh
    }

    func inDanhSachHocSinh() {
        let danhsachhocsinh: [HocSinh] = self
        for i in 0..<danhsachhocsinh.count {
            print(danhsachhocsinh[i].toString())
        }
    }
}

let danhsachhocsinh = [HocSinh(hoTen: "nguyễn Hồng Hạnh", namSinh:  1997, tongDiem: 7),
 HocSinh(hoTen: "nguyễn Hồng Thông", namSinh:  1997, tongDiem: 9),
HocSinh(hoTen: "nguyễn Hồng Tài", namSinh:  1992, tongDiem: 9),
HocSinh(hoTen: "nguyễn Hồng Phước", namSinh: 1991, tongDiem: 9),
HocSinh(hoTen: "le Huu Tiến", namSinh: 1999, tongDiem: 9)]
var danhSachHocSinhDaSapXep = danhsachhocsinh.sapXepDanhSachHocSinh()
danhSachHocSinhDaSapXep.inDanhSachHocSinh()
