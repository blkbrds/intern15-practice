import UIKit

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

    func fuctionKhac() -> String {
        return "Phep tinh khac"
    }
}

class HaiChieu: HinhVe {

}

class HinhTron: HaiChieu {
    override func dienTich() -> String {
        return "Dien Tich Hinh Tron"
    }

    override func chuVi() -> String {
        return "Chu Vi Hinh Tron"
    }
}

class HinhVuong: HaiChieu {
    override func dienTich() -> String {
        return "Dien Tich Hinh Vuong"
    }

    override func chuVi() -> String {
        return "Chu Vi Hinh Vuong"
    }
}

class HinhTamGiac: HaiChieu {
    override func dienTich() -> String {
        return "Dien Tich Hinh Tam Giac"
    }

    override func chuVi() -> String {
        return "Chu Vi Hinh Tam Giac"
    }
}

class BaChieu: HinhVe {

}

class HinhCau: BaChieu {
    override func dienTich() -> String {
        return "Dien Tich Hinh Cau"
    }

    override func chuVi() -> String {
        return "Chu Vi Hinh Cau"
    }

    override func theTich() -> String {
        return "The Tich Hinh Cau"
    }
}

class HinhLapPhuong: BaChieu {
    override func dienTich() -> String {
        return "Dien Tich Hinh Lap Phuong"
    }

    override func chuVi() -> String {
        return "Chu Vi Hinh Lap Phuong"
    }

    override func theTich() -> String {
        return "The Tich Hinh Lap Phuong"
    }
}
