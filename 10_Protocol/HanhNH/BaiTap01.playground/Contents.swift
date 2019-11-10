import UIKit

var str = "Hello, playground"
protocol DongVat {
    func ten() -> String
}
protocol Thu: DongVat {
    var isDi: Bool { get }
}
protocol Chim: DongVat {
    var isDi: Bool { get }
}
protocol Ca: DongVat {
    var isDi: Bool { get }
}
class Bo: Thu {
    var isDi: Bool { return true }
    func ten() -> String {
        return "Bo"
    }
}
class Heo: Thu {
    var isDi: Bool { return true }

    func ten() -> String {
        return "Heo"
    }
}
class HaiCau: Thu, Ca {
    var isDi: Bool { return true }

    func ten() -> String {
        return "HaiCau"
    }
}
class Doi: Thu, Chim {
    var isDi: Bool { return true }

    func ten() -> String {
        return "Doi"
    }
}
class CaSau: Thu, Ca {
    var isDi: Bool { return true }

    func ten() -> String {
        return "CaSau"
    }
}
class CaMap: Ca {
    var isDi: Bool { return true }

    func ten() -> String {
        return "CaMap"
    }
}
class CaChuon: Ca, Chim {
    var isDi: Bool { return true }

    func ten() -> String {
        return "CaChuon"
    }
}
class Ga: Chim {
    var isDi: Bool { return true }

    func ten() -> String {
        return "Ga"
    }
}
class Vit: Chim, Ca, Thu {
    var isDi: Bool { return true }

    func ten() -> String {
        return "Vit"
    }
}
var danhSach: [DongVat] = [Bo(), Heo(), HaiCau(), Doi(), CaSau(), CaMap(), CaChuon(), Ga(), Vit()]
for index in danhSach {
    print(index.ten())
}

