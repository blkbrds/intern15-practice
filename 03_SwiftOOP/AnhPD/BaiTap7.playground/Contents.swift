import UIKit

class HocSinh {
    var hoTen: String
    var namSinh: Int
    var tongDiem: Int
    init(hoTen: String,namSinh: Int,tongDiem: Int) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

class QuanLyHocSinh {
    var hocSinh: [HocSinh]
    
    init(hocSinh: [HocSinh]) {
        self.hocSinh = hocSinh
    }
    
    func sapXepThuTuGiamDanTheoTongDiem() {
        var tg: HocSinh
        for i in 0..<hocSinh.count {
            for j in i+1..<hocSinh.count{
                if hocSinh[i].tongDiem < hocSinh[j].tongDiem {
                    tg = hocSinh[i]
                    hocSinh[i] = hocSinh[j]
                    hocSinh[j] = tg
                } else if hocSinh[i].tongDiem == hocSinh[j].tongDiem {
                    if hocSinh[j].namSinh < hocSinh[i].namSinh {
                         tg = hocSinh[i]
                                           hocSinh[i] = hocSinh[j]
                                           hocSinh[j] = tg
                    }
                }
            }
        }
    }
    
    func inHocSinh(){
        for i in 0..<hocSinh.count {
            
            print("\(hocSinh[i].hoTen.capitalized), \(hocSinh[i].tongDiem)")
        }
    }
}
var hs1 = HocSinh(hoTen: "duc anh", namSinh: 2000, tongDiem: 8)
var hs2 = HocSinh(hoTen: "anh duc", namSinh: 1999, tongDiem: 8)
var quanLy = QuanLyHocSinh(hocSinh: [hs1, hs2])
print(quanLy.hocSinh[1].namSinh)
print(quanLy.sapXepThuTuGiamDanTheoTongDiem())
quanLy.inHocSinh()
