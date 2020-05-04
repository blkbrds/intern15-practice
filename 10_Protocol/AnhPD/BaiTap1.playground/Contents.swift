import UIKit

class Animal {
    func ten() -> String {
        return ""
    }
}

protocol Thu {
    var isDi: Bool { get }
}

protocol Chim {
    var isBay: Bool { get }
}

protocol Ca {
    var isBoi: Bool { get }
}

class CaChuon: Animal,Ca,Chim {
    var isBoi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Cá Chuồn"
    }
}

class Bo: Animal,Thu {
    var isDi: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Bò"
    }
}

class Ga: Animal,Chim {
    var isBay: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Gà"
    }
}

class Vit: Animal,Thu,Chim,Ca {
    var isDi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    var isBoi: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Vịt"
    }
}

class CaMap: Animal,Ca {
    var isBoi: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Ca map"
    }
}

class Heo: Animal,Thu {
    var isDi: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Heo"
    }
}

class HaiCau: Animal,Thu,Ca {
    var isDi: Bool {
        return true
    }
    
    var isBoi: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Hai cau"
    }
}

class Doi: Animal,Thu,Chim {
    var isDi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "Doi"
    }
}

class CaSau: Animal,Thu,Ca {
    var isDi: Bool {
        return true
    }
    
    var isBoi: Bool {
        return true
    }
    
    override func ten() -> String {
        super.ten()
        return "CaSau"
    }
}

var animalArr: [Animal] = [CaChuon(),Bo(),Ga(),Vit(),CaMap(),Heo(),HaiCau(),Doi(),CaSau()]

func lietKe() {
    var isDi = Set<String>()
    var isBay = Set<String>()
    var isBoi = Set<String>()
    
    for i in animalArr {
        if let test = i as? Thu, test.isDi {
            isDi.insert(i.ten())
        }
        if let test = i as? Chim, test.isBay {
            isBay.insert(i.ten())
        }
        if let test = i as? Ca, test.isBoi {
            isBoi.insert(i.ten())
        }
    }
    print("Dong vat biet bay la: \(isBay)")
    print("Dong vat biet boi la: \(isBoi)")
    print("Dong vat biet di la: \(isDi)")
    print("Dong vat vua biet bay vua biet boi la: \(isBay.intersection(isBoi))")
    print("Dong vat vua biet di vua biet bay la: \(isDi.intersection(isBay))")
    print("Dong vat vua biet boi vua biet di la: \(isBoi.intersection(isDi))")
    print("Dong vat biet ca 3 la: \((isBoi.intersection(isBay)).intersection(isDi))")
    print("Dong vat biet 1 trong 3 la: \((isBoi.symmetricDifference(isBay)).symmetricDifference(isDi))")
}
lietKe()
