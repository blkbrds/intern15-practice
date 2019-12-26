import Foundation
class HocSinh {
    var hoten: String
    var namsinh: Int
    var tongdiem: Float

    init(hoten: String, namsinh: Int, tongdiem: Float) {
        self.hoten = hoten.inHoaChuDau()
        self.namsinh = namsinh
        self.tongdiem = tongdiem
    }
}

extension String {
    func inHoaChuDau() -> String {
        let hoten: String = self
        return hoten.capitalized
    }
}

extension Array where Element : HocSinh {
    func sapxep() -> [HocSinh] {
        let ds: [HocSinh] = self
        let dss = ds.sorted { (HocSinh1, Hocsinh2) -> Bool in
            if HocSinh1.tongdiem == Hocsinh2.tongdiem {
                return HocSinh1.namsinh < Hocsinh2.namsinh
            }
            else {
                return HocSinh1.tongdiem > Hocsinh2.tongdiem
            }
        }
        return dss
    }
}

var ds: [HocSinh] = []

var hs1: HocSinh = HocSinh(hoten: "văn hiển", namsinh: 1995, tongdiem: 8.1)
var hs2: HocSinh = HocSinh(hoten: "văn nguyên", namsinh: 1998, tongdiem: 8.2)
var hs3: HocSinh = HocSinh(hoten: "văn phước", namsinh: 1998, tongdiem: 8.1)
var hs4: HocSinh = HocSinh(hoten: "văn nam", namsinh: 1996, tongdiem: 8.3)

ds.append(hs1)
ds.append(hs2)
ds.append(hs3)
ds.append(hs4)
ds.sapxep()

