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

    func inHocSinh() {
        print("\(hoTen),\(String(namSinh)),\(String(tongDiem))")
    }
    func inHoaChuCaiDau() {
        self.hoTen = self.hoTen.capitalized
    }
}

class QuanLyHocSinh {
    var arr: [HocSinh]
    init(arr: [HocSinh]) {
        self.arr = arr
    }
    func sapXep() {
        var tg : HocSinh
        for i in 0..<self.arr.count - 1 {
            for j in i+1..<self.arr.count {
                if self.arr[i].tongDiem < self.arr[j].tongDiem {
                    tg = self.arr[i]
                    self.arr[i] = self.arr[j]
                    self.arr[j] = tg
                }else if self.arr[i].tongDiem == self.arr[j].tongDiem {
                    if self.arr[i].namSinh > self.arr[j].namSinh {
                        tg = self.arr[i]
                        self.arr[i] = self.arr[j]
                        self.arr[j] = tg
                    }
                }
            }
        }
    }
    func inDanhSach() {
        for i in 0..<self.arr.count {
            self.arr[i].inHoaChuCaiDau()
            self.arr[i].inHocSinh()
        }
    }
}

var hs1 = HocSinh(hoTen: "duc anh",namSinh: 1997,tongDiem: 10)
var hs2 = HocSinh(hoTen: "anh duc",namSinh: 1998,tongDiem: 9)
var hs3 = HocSinh(hoTen: "abc",namSinh: 1995,tongDiem: 6)
var hs4 = HocSinh(hoTen: "quan bui", namSinh: 2000, tongDiem: 7)
var hs5 = HocSinh(hoTen: "bui quan", namSinh: 1996, tongDiem: 9)
var hs6 = HocSinh(hoTen: "lam", namSinh: 1984, tongDiem: 3)


var ql = QuanLyHocSinh(arr: [hs1,hs2,hs3,hs4,hs5,hs6])
ql.sapXep()
ql.inDanhSach()
