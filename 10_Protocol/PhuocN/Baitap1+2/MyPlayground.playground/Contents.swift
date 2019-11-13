import UIKit

var str = "Hello, playground"

protocol DongVat {
    func ten() -> String
}

protocol Thu: DongVat {
    var isDi: Bool { get }
}

protocol Chim: DongVat {
    var isBay: Bool { get }
}

protocol Ca: DongVat {
    var isBoi: Bool { get }
}

class CaChuon: Ca, Chim {
    var isBoi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ca chuon"
    }
}

class Bo: Thu {
    var isDi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Bo"
    }
}

class CaMap: Ca {
    var isBoi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ca map"
    }
}

class Heo: Thu {
    var isDi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Heo"
    }
}

class HaiCau: Ca, Thu {
    var isBoi: Bool {
        return true
    }
    
    var isDi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Hai cau"
    }
}

class Doi: Thu, Chim {
    var isDi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    func ten() -> String {
        return "Doi"
    }
}

class Ga: Chim {
    var isBay: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ga"
    }
}

class Vit: Ca, Chim, Thu {
    var isBoi: Bool {
        return true
    }
    
    var isDi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    func ten() -> String {
        return "Vit"
    }
}

class CaSau: Ca, Thu {
    var isBoi: Bool {
        return true
    }
    
    var isDi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ca sau"
    }
}

var dongVats: [DongVat] = [CaChuon(), CaMap(), CaSau(), HaiCau(), Ga(), Vit(), Bo(), Doi(), Heo()]
print(dongVats.map { $0.ten() })
