import UIKit

class HocSinh {
    let hoTen: String
    let namSinh: Int
    let tongDiem: Float

    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen.inHoaTen()
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
    func toString() -> String {
        return "Ho Ten: \(hoTen), sinh nam: \(namSinh) co tong diem: \(tongDiem)"
    }
}

extension String {
    func inHoaTen() -> String {
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

    func inDanhSach() {
        let danhSachHocSinh: [HocSinh] = self
        for i in 0..<danhSachHocSinh.count {
            print(danhSachHocSinh[i].toString())
        }
    }
}



var hocSinh: [HocSinh] = []
hocSinh.append(HocSinh(hoTen: "Le Van A", namSinh: 1998, tongDiem: 9.9))
hocSinh.append(HocSinh(hoTen: "Nguyen Thi B", namSinh: 1998, tongDiem: 9.0))
hocSinh.append(HocSinh(hoTen: "Tran van c", namSinh: 1995, tongDiem: 7.5))
hocSinh.append(HocSinh(hoTen: "Trinh Thi D", namSinh: 1997, tongDiem: 7.5))
hocSinh.append(HocSinh(hoTen: "Huynh Thi E", namSinh: 1990, tongDiem: 7.5))
hocSinh.append(HocSinh(hoTen: "ta Van f", namSinh: 1989, tongDiem: 4.0))

var danhSachHocSinh = hocSinh.sapXepDanhSachHocSinh()
danhSachHocSinh.inDanhSach()



