import UIKit

class HocSinh {
    let hoTen: String
    let namSinh: Int
    let tongDiem: Float
    
    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
    func inHoaTen(ten: String) {
    }
    
    func inDiem(hocSinh: HocSinh) {
        print(hocSinh.tongDiem)
    }
    
    func inDanhSach() -> [HocSinh]{
        return
    }
}

var hocSinh: [HocSinh] = []
hocSinh.append(HocSinh(hoTen: "Le Van A", namSinh: 1998, tongDiem: 9.9))
hocSinh.append(HocSinh(hoTen: "Nguyen Thi B", namSinh: 1998, tongDiem: 9.0))
hocSinh.append(HocSinh(hoTen: "Tran Van C", namSinh: 1995, tongDiem: 6.0))
hocSinh.append(HocSinh(hoTen: "Trinh Thi D", namSinh: 1997, tongDiem: 7.5))
hocSinh.append(HocSinh(hoTen: "Huynh Thi E", namSinh: 1990, tongDiem: 6.5))
hocSinh.append(HocSinh(hoTen: "Ta Van F", namSinh: 1989, tongDiem: 4.0))
for i in 0..<hocSinh.count {
    hocSinh[i].inDiem(hocSinh: hocSinh[i])
}

var thang: HocSinh = HocSinh(hoTen: "Le Van Thang", namSinh: 1998, tongDiem: 9.9)
thang.inHoaTen(ten: thang.hoTen)



