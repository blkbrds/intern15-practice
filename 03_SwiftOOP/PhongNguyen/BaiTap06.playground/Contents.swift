import Foundation

class HinhVe {
    var ten: String

    init(ten: String) {
        self.ten = ten
    }

    func dienTich() -> String {
        return "Dien Tich"
    }

    func chuVi() -> String {
        return "Chu Vi"
    }

    func theTich() -> String {
        return "The Tich"
    }
}
class HaiChieu: HinhVe{
    
}
class BaChieu: HinhVe {
    
}

class HinhTron: HaiChieu{
    override func dienTich() -> String {
        return "Day la chu vi hinh tron"
    }
    override func chuVi() -> String {
        return "Day la dien tich hinh tron"
    }
}
class HinhVuong: HaiChieu {
    override func dienTich() -> String {
        return "Day la chu vi Hinh Vuong"
    }
    override func chuVi() -> String {
        return "Day la dien tich Hinh Vuong"
    }
}
class HinhTamGiac: HaiChieu {
    override func dienTich() -> String {
        return "Day la chu vi Hinh Tam Giac"
    }
    override func chuVi() -> String {
        return "Day la dien tich Hinh Tam Giac"
    }
}
class HinhCau: BaChieu {
    override func dienTich() -> String {
        return "Day la chu vi Hinh cau"
    }
    override func chuVi() -> String {
        return "Day la dien tich Hinh cau"
    }
    override func theTich() -> String {
        return "Day la the tich Hinh cau"
    }
    
}
class HinhLapPhuong: BaChieu {
    override func dienTich() -> String {
        return "Day la chu vi Hinh Lap Phuong"
    }
    override func chuVi() -> String {
        return "Day la dien tich Hinh Lap Phuong"
    }
    override func theTich() -> String {
        return "Day la the tich Hinh Lap Phuong"
    }
}

