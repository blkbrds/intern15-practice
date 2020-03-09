import UIKit
func tongBinhPhuongCuaMotSo(soBanDau: Int) -> Int {
    var soTam: Int = 0
    var soDuocCopy: Int = soBanDau
    while soDuocCopy != 0 {
        soTam = (soDuocCopy % 10) * (soDuocCopy % 10)
        soDuocCopy = soDuocCopy / 10
    }
    return soTam
}

func kiemTraSoHanhPhuc(soCanKiemTra: Int) -> Bool {
    if soCanKiemTra == 1 {
        return true
    }
    var hanhPhuc: Int = soCanKiemTra
    var mangTam: [Int] = []
    while hanhPhuc > 1 && !mangTam.contains(hanhPhuc) {
        mangTam.append(hanhPhuc)
        hanhPhuc = tongBinhPhuongCuaMotSo(soBanDau: hanhPhuc)
    }
    return hanhPhuc == 1
}

func lietKeSoHanhPhuc() {
    for i in 1...100 {
        if kiemTraSoHanhPhuc(soCanKiemTra: i) == true {
            print(i)
        }
    }
}

lietKeSoHanhPhuc()

func inMang(mang :[Int]){
    var a = mang
    a = a.shuffled()
    print (a)
}
inMang(mang: [4,2,1,3])

func thaydoiMang(mang:[Int],giaTriCu:Int,giaTriMoi:Int)->[Int]{
    var bienTam = mang
    for i in 0..<bienTam.count where bienTam[i] == giaTriCu {
        bienTam[i] = giaTriMoi
    }
    return bienTam
}
thaydoiMang(mang: [1,2,4,4,2,4], giaTriCu: 4, giaTriMoi: 5)


