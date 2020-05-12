import UIKit

class Animals {
    func name() -> String {
        return ""
    }
}

protocol Animal {
    var go: Bool { get }
}

protocol Bird {
    var fly: Bool { get }
}

protocol Fish {
    var swim: Bool { get }
}

class FlyingFish: Animals, Fish, Bird {
    var swim: Bool {
        return true
    }
    
    var fly: Bool {
        return true
    }
    
    override func name() -> String {
        return "Cá Chuồn"
    }
}

class Cows: Animals, Animal {
    var go: Bool {
        return true
    }
    
    override func name() -> String {
        return "Bò"
    }
}

class Chicken: Animals, Bird {
    var fly: Bool {
        return true
    }
    
    override func name() -> String {
        return "Gà"
    }
}

class Duck: Animals, Animal, Bird, Fish {
    var go: Bool {
        return true
    }
    
    var fly: Bool {
        return true
    }
    
    var swim: Bool {
        return true
    }
    
    override func name() -> String {
        return "Vịt"
    }
}

class Shark: Animals, Fish {
    var swim: Bool {
        return true
    }
    
    override func name() -> String {
        return "Ca map"
    }
}

class Pig: Animals, Animal {
    var go: Bool {
        return true
    }
    
    override func name() -> String {
        return "Heo"
    }
}

class WaterSeal: Animals, Animal, Fish {
    var go: Bool {
        return true
    }
    
    var swim: Bool {
        return true
    }
    
    override func name() -> String {
        return "Hai cau"
    }
}

class Bats: Animals, Animal, Bird {
    var go: Bool {
        return true
    }
    
    var fly: Bool {
        return true
    }
    
    override func name() -> String {
        return "Doi"
    }
}

class Crocodile: Animals, Animal, Fish {
    var go: Bool {
        return true
    }
    
    var swim: Bool {
        return true
    }
    
    override func name() -> String {
        return "CaSau"
    }
}

var animalArr: [Animals] = [FlyingFish(),Cows(),Chicken(),Duck(),Shark(),Pig(),WaterSeal(),Bats(),Crocodile()]

func enumerateAnimals() {
    var isDi = Set<String>()
    var isBay = Set<String>()
    var isBoi = Set<String>()
    
    for i in animalArr {
        if let test = i as? Animal, test.go {
            isDi.insert(i.name())
        }
        if let test = i as? Bird, test.fly {
            isBay.insert(i.name())
        }
        if let test = i as? Fish, test.swim {
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
enumerateAnimals()
