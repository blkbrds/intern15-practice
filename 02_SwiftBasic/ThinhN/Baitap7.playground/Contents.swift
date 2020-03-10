import UIKit

func thaydoiMang(mang:[Int],giaTriCu:Int,giaTriMoi:Int)->[Int]{
    var bienTam = mang
    for i in 0..<bienTam.count where bienTam[i] == giaTriCu {
        bienTam[i] = giaTriMoi
    }
    return bienTam
}
thaydoiMang(mang: [1,2,4,4,2,4], giaTriCu: 4, giaTriMoi: 5)
