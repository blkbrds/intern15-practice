//import UIKit

class HocSinh{
    var hoTen :String
    var namSinh: Int
    var tong : Double
    init(hoTen: String, namSinh: Int, tong : Double) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tong = tong
    }
    func inDanhSach() -> String {
        return "Ho ten: \(hoTen.vietHoa()), nam sinh: \(namSinh), tong: \(tong)"
    }
    
}
extension String {
  func vietHoa() -> String {
    guard let kiTuDau = first, kiTuDau.isLowercase else { return self }
    return String(kiTuDau).uppercased() + dropFirst()
  }
}
extension Array where Element: HocSinh{
    func bubbleSapXepHS() -> [HocSinh]{
        var listHS : [HocSinh] = self
        
        listHS.sort { (hocSinh1, hocSinh2) -> Bool in
            if hocSinh1.tong == hocSinh2.tong {
                return hocSinh1.namSinh < hocSinh2.namSinh
            } else {
                return hocSinh1.tong > hocSinh2.tong
            }
        }
        return listHS
    }
    func inDsHocSinh() {
        let listHS : [HocSinh] = self
        for i in 0..<listHS.count {
            print(listHS[i].inDanhSach())
        }
    }
}
var listHS: [HocSinh] = [HocSinh(hoTen: "chung", namSinh: 92, tong: 9), HocSinh(hoTen: "van", namSinh: 93, tong: 9), HocSinh(hoTen: "pham", namSinh: 93, tong: 8), HocSinh(hoTen: "nguye", namSinh: 92, tong: 10)
]




print("Sap xep danh sach")
var dsHS = listHS.bubbleSapXepHS()
dsHS.inDsHocSinh()




