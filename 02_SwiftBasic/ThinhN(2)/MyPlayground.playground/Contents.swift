import UIKit
//// Bai 34
//func tinhTong(n: Int) -> Float {
//    var S: Float = 0
//    for i in 1...n {
//        S = sqrt(Float(n - (n - i)) + S)
//    }
//    return S
//}
//tinhTong(n: 3)
////Bai 61
//func kiemTraSo(n: Int) -> Bool {
//    var i = 0
//    var tam = n
//    var chuoiSo: [Int] = []
//    while tam != 0 {
//        i = tam % 10
//        tam = tam / 10
//        chuoiSo.append(i)
//    }
//    for i in 0..<chuoiSo.count - 1 {
//        if chuoiSo[i] < chuoiSo[i + 1] {
//            continue
//        } else {
//            return false
//        }
//    }
//    return true
//}
//kiemTraSo(n: 98741)
//// Bai 87
//func timNnhoNhat() -> Int {
//    var S = 0
//    var n = 1
//    while S < 10000 {
//        n += 1
//        S = S + n
//    }
//    return n
//}
//timNnhoNhat()
//// Bai 102
//func ngayKeTiep(ngay: Int, thang: Int, nam: Int) -> (Int, Int, Int) {
//    if ngay + 1 <= soNgayTrongThang(thang: thang, nam: nam) {
//        return (ngay + 1, thang, nam)
//    } else {
//        if thang < 12 {
//            return (1, thang + 1, nam)
//        } else {
//            return (1, 1, nam + 1)
//        }
//    }
//}
//func soNgayTrongThang(thang: Int, nam: Int) -> Int {
//    if nam % 4 == 0 && thang == 2 {
//        return 29
//    }
//    switch thang {
//    case 1, 3, 5, 8, 10, 12:
//        return 31
//    case 4, 6, 7, 9, 11:
//        return 30
//    default:
//        return 28
//    }
//}
//ngayKeTiep(ngay: 1, thang: 3, nam: 2020)
////Bai 124
//func kiemTraSoNguyen(mang: [Int]) -> Bool {
//    for i in 0..<mang.count {
//        if mang[i] % 2 == 0 && mang[i] < 2004 {
//            return true
//        }
//    }
//    return false
//}
//kiemTraSoNguyen(mang: [3, 5, 7])
////Bai 155
//func giaTriXaNhat(mang: [Int], x: Int) -> Int {
//    var mangTam: [Int] = []
//    var giaTriTam: Int
//    var viTriLonNhat: Int = 0
//    var giaTriLonNhat: Int = 0
//    for i in 0..<mang.count {
//        giaTriTam = abs(mang[i] - x)
//        mangTam.append(giaTriTam)
//    }
//    for i in 0..<mangTam.count {
//        if mangTam[i] > giaTriLonNhat {
//            giaTriLonNhat = mangTam[i]
//        }
//    }
//    for i in 0..<mangTam.count {
//        if mangTam[i] == giaTriLonNhat {
//            viTriLonNhat = i
//        }
//    }
//    print("Gia tri xa nhat la : \(mang[viTriLonNhat])")
//    return 1
//}
//giaTriXaNhat(mang: [3, 6, 10, 30, -20], x: 6)
////Bai 260
//func kiemTraHoanVi(mangA: [Int], mangB: [Int]) -> Bool {
//    var mangBNguoc: [Int] = []
//    var giaTriNguoc: Int
//    var i: Int = mangB.count - 1
//
//    if mangA.count != mangB.count {
//           return false
//       }
//    while i >= 0 {
//        giaTriNguoc = mangB[i]
//        mangBNguoc.append(giaTriNguoc)
//        i -= 1
//    }
//    for i in 0..<mangA.count {
//        if mangA[i] == mangBNguoc [i] {
//            return true
//        } else {
//            return false
//        }
//    }
//    return false
//}
//kiemTraHoanVi(mangA: [2, 5, 6], mangB: [6, 5, 1])
////Bai 667
//func tinhThanh(tinh: [[String: Any]]) {
//    var dienTichLonNhat: Int = 0
//    var tam: Int
//    var tam2: String
//    var mangTam: [Int] = []
//    var mangCacTinh: [String] = []
//    for item in tinh {
//        if let danSo = item["danSo"] as? Int {
//            if danSo > 1000 {
//                print(item)
//            }
//        }
//    }
//    for item1 in tinh {
//        if let dienTich = item1["dienTich"] as? Int {
//            if dienTich > dienTichLonNhat {
//                dienTichLonNhat = dienTich
//            }
//        }
//    }
//    print("Tinh co dien tich lon nhat la: \(dienTichLonNhat)")
//    for item2 in tinh {
//        if let dienTich1 = item2["dienTich"] as? Int {
//            mangTam.append(dienTich1)
//        }
//    }
//    for item2 in tinh {
//        if let tenTinh = item2["tenTinh"] as? String {
//            mangCacTinh.append(tenTinh)
//        }
//    }
//    for i in 0..<mangTam.count - 1 {
//        for j in i + 1..<mangTam.count {
//            if mangTam[i] < mangTam[j] {
//                tam = mangTam[i]
//                tam2 = mangCacTinh[i]
//                mangTam[i] = mangTam[j]
//                mangCacTinh[i] = mangCacTinh[j]
//                mangTam[j] = tam
//                mangCacTinh[j] = tam2
//                }
//            }
//        }
//    print(mangCacTinh)
//}
//tinhThanh(tinh: [["maTinh": 1, "tenTinh": "HaNoi", "danSo" : 1200, "dienTich" : 49665], ["maTinh": 2, "tenTinh": "DaNang", "danSo" : 120, "dienTich" : 456 ], ["maTinh": 3, "tenTinh": "HoChiMinh", "danSo" : 1200, "dienTich" : 4555], ["maTinh": 4, "tenTinh": "QuangNam", "danSo" : 1200, "dienTich" : 225]])
////Bai 413
//func sapXepChanLe(mang: [[Int]]) -> ( [[Int]]) {
//    var mangTam: [[Int]] = mang
//    var mangKetQua: [[Int]] = []
//
//    for i in 0..<mangTam.count  {
//        if i % 2 == 0 {
//            mangTam[i] = sapXepTangDan(mangA: mangTam[i])
//            mangKetQua.append(mangTam[i])
//        } else {
//            mangTam[i] = sapXepGiamDan(mangB: mangTam[i])
//            mangKetQua.append(mangTam[i])
//        }
//    }
//    print(mangKetQua)
//    return mangKetQua
//}
//func sapXepTangDan(mangA: [Int]) -> [Int] {
//    var tam: Int
//    var mang: [Int] = []
//    for i in 0..<mangA.count {
//        mang.append(mangA[i])
//    }
//    for i in 0..<mang.count - 1 {
//        for j in i + 1..<mang.count {
//            if mang[i] > mang[j] {
//                tam = mang[i]
//                mang[i] = mang[j]
//                mang[j] = tam
//            }
//        }
//    }
//    return mang
//}
//func sapXepGiamDan(mangB: [Int]) -> [Int] {
//    var tam: Int
//    var mang: [Int] = []
//    for i in 0..<mangB.count{
//        mang.append(mangB[i])
//    }
//    for i in 0..<mang.count - 1 {
//        for j in i + 1..<mang.count {
//            if mang[i] < mang[j] {
//                tam = mang[i]
//                mang[i] = mang[j]
//                mang[j] = tam
//            }
//        }
//    }
//    return mang
//}
//sapXepChanLe(mang: [[120, 24], [14, 22], [15, 60], [22, 10], [11, 12], [14, 20]])

// workAtHome
//Bai 320
func tinhTong(soNhap: [[Float]]) -> Float {
    var n: Float = 0
    for i in 0..<soNhap.count {
        n = tongS(mangA: soNhap[i]) + n
    }
    return n
}
func tongS(mangA: [Float]) -> Float {
    var tam: Float = 0
    for i in 0..<mangA.count  {
        if mangA[i] > 0 {
            tam += mangA[i]
        }
    }
  return tam
}
tinhTong(soNhap: [[-1.4, -2.4, -3.4], [1.4, 2.4]])
//Bai 676
func hocSinh(hocSinh: [[String: Any]]) {
    var mangVan: [Int] = []
    var mangToan: [Int] = []
    var tam: Int = 0
    for item in hocSinh {
        print(item )
    }
    for item in hocSinh {
        if let diemVan = item["diemVan"] as? Int {
            mangVan.append(diemVan)
        }
    }
    print("Diem van la: \(mangVan)")
    for item in hocSinh {
        if let diemToan = item["diemToan"] as? Int {
            mangToan.append(diemToan)
        }
    }
    print("Diem toan la: \(mangToan)")
    for i in 0..<mangToan.count {
        if mangToan[i] > 8 && mangVan[i] > 8 {
            tam += 1
        }
    }
    print("So hoc sinh gioi la : \(tam)")
}
hocSinh(hocSinh: [["tenHocSinh": "NguyenPhuocThinh", "diemToan": 9, "diemVan": 10, "diemTrungBinh": 19], ["tenHocSinh": "NguyenPhuocThinh2", "diemToan": 10, "diemVan": 10, "diemTrungBinh": 20], ["tenHocSinh": "NguyenPhuocThinh", "diemToan": 1, "diemVan": 9, "diemTrungBinh": 3], ["tenHocSinh": "NguyenPhuocThinh", "diemToan": 9, "diemVan": 6, "diemTrungBinh": 19] ])

//Bai 677
func lopHoc(lopHoc: [[String: Any]]) {
    var siSoLonNhat: Int = 0
    for item in lopHoc {
        print(item)
    }
    for i in lopHoc {
        if let siSo = i["siSo"] as? Int {
            if siSo > siSoLonNhat {
                siSoLonNhat = siSo
            }
        }
    }
    print("Lop co si so lon nhat la \(siSoLonNhat)")
}
lopHoc(lopHoc: [["tenLop": "10", "siSo": 3, "danhSach": "Le Van A, Tran Van B, Dang Van C"], ["tenLop": "11", "siSo": 113, "danhSach": "Le Van A, Tran Van B, Dang Van C"], ["tenLop": "12", "siSo": 11, "danhSach": "Le Van A, Tran Van B, Dang Van C"]])

// Bai 232
func sapXepMang(mang: [Int]) -> [Int] {
    var tam: Int
    var mangA: [Int] = mang
    for i in 0..<mang.count - 1 {
        for j in i + 1..<mangA.count {
            if mangA[i] > mangA[j] {
                tam = mangA[i]
                mangA[i] = mangA[j]
                mangA[j] = tam
            }
        }
    }
    return mangA
}
func kiemTraMang(mang: [Int], x: Int) -> Bool {
    for i in 0..<mang.count {
        if mang[i] == x {
            return true
        }
    }
    return false
}
func lietKeLapLai(mang: [Int]) -> [Int] {
    var mangLap: [Int] = []
    for i in 0..<mang.count - 1 {
        for j in i + 1..<mang.count {
            if mang[i] == mang[j] &&  kiemTraMang(mang: mangLap, x: mang[i]) == false {
                mangLap.append(mang[i])
            }
        }
    }
    print("mangketqua\(mangLap)")
    return mangLap
}
lietKeLapLai(mang: [2, 2, 1, 3, 3, 3, 4, 3, 4, 5, 5])
//Bai 50(xong)
func timSoDao(so: Int) -> Int {
    var tam: Int = 0
    var soNhap: Int = so
    var soDaoNguoc: Int = 0
    while soNhap != 0 {
        tam = soNhap % 10
        soDaoNguoc = soDaoNguoc * 10 + tam
        soNhap = soNhap / 10
    }
    return soDaoNguoc
}
timSoDao(so: 23444)

//Bai 265 (Xong)
func sapXepMang(mangA: [Int], mangB: [Int]) -> [Int] {
    var mang: [Int] = mangA
    var mangGiamDan: [Int] = []
    for i in 0..<mangB.count {
        mang.append(mangB[i])
        mangGiamDan = sapXepMang(mang: mang)
        }
    print(mangGiamDan)
    return mangGiamDan
}
func sapXepGiamDan(mang: [Int] ) -> [Int] {
    var tam: Int = 0
    var mangSapXep: [Int] = mang
    for i in 0..<mangSapXep.count - 1 {
        for j in i + 1..<mangSapXep.count {
            if mangSapXep[i] < mangSapXep[j] {
                tam = mangSapXep[i]
                mangSapXep[i] = mangSapXep[j]
                mangSapXep[j] = tam
            }
        }
    }
  return mangSapXep
}
sapXepMang(mangA: [4, 5, 7, 8], mangB: [1, 2, 5, 6])

//Bai 334
func demSoDuong(soNhap: [[Float]]) -> [Float] {
    var dem: Float
    var mang: [Float] = []
    for i in 0..<soNhap.count {
        dem = hamDem(so: soNhap[i])
        mang.append(dem)
    }
    print(mang)
    return mang
}
func hamDem(so: [Float]) -> Float {
    var dem: Float = 0
    for i in 0..<so.count{
        if so[i] >= 0 {
            dem += 1
        }
    }
    return dem
}
demSoDuong(soNhap: [[3, 4, -95, 7, 8, -3], [6, 5, 4, 3, 2], [6, 5, 4]])

