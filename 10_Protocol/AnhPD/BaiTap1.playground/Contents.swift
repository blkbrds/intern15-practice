import UIKit

class Animals {
    func name() -> String {
        return ""
    }
}

protocol Animal {
    var canGo: Bool { get }
}

protocol Bird {
    var canFly: Bool { get }
}

protocol Fish {
    var canSwim: Bool { get }
}

class FlyingFish: Animals, Fish, Bird {
    var canSwim: Bool {
        return true
    }
    
    var canFly: Bool {
        return true
    }
    
    override func name() -> String {
        return "Cá Chuồn"
    }
}

class Cows: Animals, Animal {
    var canGo: Bool {
        return true
    }
    
    override func name() -> String {
        return "Bò"
    }
}

class Chicken: Animals, Bird {
    var canFly: Bool {
        return true
    }
    
    override func name() -> String {
        return "Gà"
    }
}

class Duck: Animals, Animal, Bird, Fish {
    var canGo: Bool {
        return true
    }
    
    var canFly: Bool {
        return true
    }
    
    var canSwim: Bool {
        return true
    }
    
    override func name() -> String {
        return "Vịt"
    }
}

class Shark: Animals, Fish {
    var canSwim: Bool {
        return true
    }
    
    override func name() -> String {
        return "Ca map"
    }
}

class Pig: Animals, Animal {
    var canGo: Bool {
        return true
    }
    
    override func name() -> String {
        return "Heo"
    }
}

class WaterSeal: Animals, Animal, Fish {
    var canGo: Bool {
        return true
    }
    
    var canSwim: Bool {
        return true
    }
    
    override func name() -> String {
        return "Hai cau"
    }
}

class Bats: Animals, Animal, Bird {
    var canGo: Bool {
        return true
    }
    
    var canFly: Bool {
        return true
    }
    
    override func name() -> String {
        return "Doi"
    }
}

class Crocodile: Animals, Animal, Fish {
    var canGo: Bool {
        return true
    }
    
    var canSwim: Bool {
        return true
    }
    
    override func name() -> String {
        return "CaSau"
    }
}

var animalArr: [Animals] = [FlyingFish(),Cows(),Chicken(),Duck(),Shark(),Pig(),WaterSeal(),Bats(),Crocodile()]

func enumerateAnimals() {
    var canGo = Set<String>()
    var canFly = Set<String>()
    var canSwim = Set<String>()
    
    for i in animalArr {
        if let test = i as? Animal, test.canGo {
            canGo.insert(i.name())
        }
        if let test = i as? Bird, test.canFly {
            canFly.insert(i.name())
        }
        if let test = i as? Fish, test.canSwim {
            canSwim.insert(i.name())
        }
    }
    print("Dong vat biet bay la: \(canFly)")
    print("Dong vat biet boi la: \(canSwim)")
    print("Dong vat biet di la: \(canGo)")
    print("Dong vat vua biet bay vua biet boi la: \(canFly.intersection(canSwim))")
    print("Dong vat vua biet di vua biet bay la: \(canGo.intersection(canFly))")
    print("Dong vat vua biet boi vua biet di la: \(canSwim.intersection(canGo))")
    print("Dong vat biet ca 3 la: \((canSwim.intersection(canFly)).intersection(canGo))")
    print("Dong vat biet 1 trong 3 la: \((canSwim.symmetricDifference(canFly)).symmetricDifference(canGo))")
}
enumerateAnimals()
