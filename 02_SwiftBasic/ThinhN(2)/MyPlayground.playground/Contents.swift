import UIKit

//func tinhTong(n: Int) -> Float {
//    var S: Float = 0
//    for i in 1...n {
//        S = sqrt(Float(n - (n - i)) + S)
//    }
//    return S
//}
//tinhTong(n: 3)
//
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
//
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
//
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
//
//func kiemTraSoNguyen(mang: [Int]) -> Bool {
//    for i in 0..<mang.count {
//        if mang[i] % 2 == 0 && mang[i] < 2004 {
//            return true
//        }
//    }
//    return false
//}
//kiemTraSoNguyen(mang: [3, 5, 7])
//
//func giaTriXaNhat(mang: [Int], x: Int) -> Int {
//    var mangTam: [Int] = []
//    var giaTriTam: Int
//    var viTriLonNhat: Int = 0
//    var giaTriLonNhat: Int = 0
//    for i in 0..<mang.count {
//        giaTriTam = abs(mang[i] - x)
//        mangTam.append(giaTriTam)
//    }
//    print(mangTam)
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
//    print(mang[viTriLonNhat])
//    return 1
//}
//
//giaTriXaNhat(mang: [3, 6, 10, 30, -20], x: 6)
//
//func kiemTraHoanVi(mangA: [Int], mangB: [Int]) -> Bool {
//    var mangBNguoc: [Int] = []
//    var giaTriNguoc: Int
//    var i: Int = mangB.count - 1
//
//    while i >= 0 {
//        giaTriNguoc = mangB[i]
//        mangBNguoc.append(giaTriNguoc)
//        i -= 1
//    }
//    if mangA.count != mangBNguoc.count {
//        return false
//    }
//    if mangA.count == mangBNguoc.count {
//        for i in 0..<mangA.count {
//            for i2 in 0..<mangBNguoc.count {
//                if mangA[i] == mangBNguoc [i2] {
//                    return true
//                } else {
//                    return false
//                }
//            }
//        }
//    }
//    return false
//}
//kiemTraHoanVi(mangA: [2,5,6], mangB: [6,5,2])

//func sapXepChanLe(mang: [mang1[Int], mang2[Int]]) -> ([Int], [Int]) {
//
//    return 1
//}

func tinhThanh(tinh: [[String: Any]]) {
    var dienTichLonNhat: Int = 0
    var tam: Int
    var giaTri: Int = 0
    var mangTam: [Int] = []
    for item in tinh {
        if let danSo = item["danSo"] as? Int {
            if danSo > 1000 {
                print(item)
            }
        }
    }
    for item1 in tinh {
        if let dienTich = item1["dienTich"] as? Int {
            if dienTich > dienTichLonNhat {
                dienTichLonNhat = dienTich
            }
        }
    }
    print("Tinh co dien tich lon nhat la \(dienTichLonNhat)")
    for item2 in tinh {
        if let dienTich1 = item2["dienTich"] as? Int {
            mangTam.append(dienTich1)
        }
    }
    for i in 0..<mangTam.count - 1 {
        for j in i + 1..<mangTam.count {
            if mangTam[i] < mangTam[j] {
                tam = mangTam[i]
                mangTam[i] = mangTam[j]
                mangTam[j] = tam
            }
        }
    }
    
    print("Sap xep mang \(mangTam))")
}
tinhThanh(tinh: [["maTinh": 1, "tenTinh": "HaNoi", "danSo" : 1200, "dienTich" : 45], ["maTinh": 2, "tenTinh": "HaNoi2", "danSo" : 120, "dienTich" : 456 ], ["maTinh": 3, "tenTinh": "HaNoi", "danSo" : 1200, "dienTich" : 4555]])

