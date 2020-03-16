import UIKit

class HocSinh {
    var hoTen: String
    var namSinh: Int
    var tongDiem: Double

    init(hoTen: String, namSinh: Int, tongDiem: Double) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
    func inHoaTen (){
        hoTen = hoTen.capitalized
    }
    
    func DanhSach ()->String {
        return "Ten hoc sinh : \(hoTen) nam sinh \(namSinh) tong diem \(tongDiem)"
    }
}
class StudentManagement {
    var n :Int
    var mangHocSinh: [HocSinh]
    
    init(n:Int,mangHocSinh:[HocSinh]){
    self.n = n
    self.mangHocSinh = mangHocSinh
    }
    
    func nhapDanhSach(mangHocSinh: [HocSinh]) {
        self.mangHocSinh = mangHocSinh
    }
    
  func sapXepGiamDanTongDiem() {
      var tam :HocSinh
    for i in 0 ..< self.n-1 {
        for j in i+1..<n {
            if self.mangHocSinh[i].tongDiem < self.mangHocSinh[j].tongDiem {
                tam = self.mangHocSinh[i]
                self.mangHocSinh[i] = self.mangHocSinh[j]
                self.mangHocSinh[j] = tam
            }else if self.mangHocSinh[i].tongDiem == self.mangHocSinh[j].tongDiem {
                if self.mangHocSinh[i].namSinh < self.mangHocSinh[j].namSinh {
                    tam = self.mangHocSinh[i]
                    self.mangHocSinh[i] = mangHocSinh[j]
                   mangHocSinh[j] = tam
                }
            }
        }
    }
}
    func inDanhSach(){
        for i in 0..<n{
            mangHocSinh[i].inHoaTen()
            print(mangHocSinh[i].DanhSach())
        }
    }
}

var Ten1 = HocSinh.init(hoTen: "Nguyen phuoc thinh" , namSinh: 1997, tongDiem: 9.6)
var Ten2 = HocSinh.init(hoTen: "nguyen thanh tung", namSinh: 1994, tongDiem: 8.5)
var Ten3 = HocSinh.init(hoTen: "tran hoan nguyen", namSinh: 1992, tongDiem: 8.2)
var Ten4 = HocSinh.init(hoTen: "le van cuong", namSinh: 1992, tongDiem: 9.6)
var danhsach = StudentManagement.init(n: 4, mangHocSinh: [Ten1,Ten2,Ten3,Ten4])

danhsach.sapXepGiamDanTongDiem()
danhsach.inDanhSach()
