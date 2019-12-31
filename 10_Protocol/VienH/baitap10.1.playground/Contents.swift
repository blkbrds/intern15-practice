import UIKit

var str = "Hello, playground"

protocol DongVat {
    func ten() -> String
}

protocol Thu: DongVat {
    var isDi: Bool {get}
}

protocol Chim: DongVat {
    var isBay: Bool {get}
}

protocol Ca: DongVat {
    var isBoi: Bool {get}
}

class CaChuon: Ca {
    var isBoi: Bool {
        return true
    }
    
    func ten() -> String {
        return "Ca Chuon"
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

class Ga: Thu, Chim {
    var isDi: Bool {
        return true
    }
    var isBay: Bool {
        return true
    }
    func ten() -> String {
        return "Ga"
    }
}

class Vit: Thu, Chim {
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
class CaMap: Ca {
    var isBoi: Bool {
        return true
    }
    func ten() -> String {
        return "CaMap"
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

class HaiCau: Thu, Ca {
    var isBoi: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "HaiCau"
    }
}
class Doi: Chim, Thu {
    var isBay: Bool {
        return true
    }
    var isDi: Bool {
        return true
    }
    func ten() -> String {
        return "Doi"
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
        return "CaSau"
    }
}
var dongVats: [DongVat] = [CaChuon(), CaMap(), CaSau(), HaiCau(), Ga(), Vit(), Bo(), Doi(), Heo()]
print(dongVats.map { $0.ten() })




    
    



