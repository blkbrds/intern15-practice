import UIKit

class Animals {
    func name() -> String {
        return ""
    }
}

protocol Animal {
    var isDi: Bool { get }
}

protocol Bird {
    var isBay: Bool { get }
}

protocol Fish {
    var isBoi: Bool { get }
}

class FlyingFish: Animals, Fish, Bird {
    var isBoi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Cá Chuồn"
    }
}

class Cows: Animals, Animal {
    var isDi: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Bò"
    }
}

class Chicken: Animals, Bird {
    var isBay: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Gà"
    }
}

class Duck: Animals, Animal, Bird, Fish {
    var isDi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    var isBoi: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Vịt"
    }
}

class Shark: Animals, Fish {
    var isBoi: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Ca map"
    }
}

class Pig: Animals, Animal {
    var isDi: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Heo"
    }
}

class WaterSeal: Animals, Animal, Fish {
    var isDi: Bool {
        return true
    }
    
    var isBoi: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Hai cau"
    }
}

class Bats: Animals, Animal, Bird {
    var isDi: Bool {
        return true
    }
    
    var isBay: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "Doi"
    }
}

class Crocodile: Animals, Animal, Fish {
    var isDi: Bool {
        return true
    }
    
    var isBoi: Bool {
        return true
    }
    
    override func name() -> String {
        super.name()
        return "CaSau"
    }
}

var animalArr: [Animals] = [FlyingFish(),Cows(),Chicken(),Duck(),Shark(),Pig(),WaterSeal(),Bats(),Crocodile()]

func listed() {
    var isDi = Set<String>()
    var isBay = Set<String>()
    var isBoi = Set<String>()
    
    for i in animalArr {
        if let test = i as? Animal, test.isDi {
            isDi.insert(i.name())
        }
        if let test = i as? Bird, test.isBay {
            isBay.insert(i.name())
        }
        if let test = i as? Fish, test.isBoi {
            isBoi.insert(i.name())
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
listed()
