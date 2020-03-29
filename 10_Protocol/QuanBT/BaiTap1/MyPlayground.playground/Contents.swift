import UIKit

class Animal {
    func getName() -> String {
        return ""
    }
}

protocol BeastProtocol {
    var canMove: Bool { get }
}

protocol BirdProtocol {
    var canFly: Bool { get }
}

protocol FishProtocol {
    var canSwim: Bool { get }
}

final class FlyingFish: Animal, FishProtocol, BirdProtocol {
    var canSwim: Bool {
        return true
    }
    
    var canFly: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Cá Chuồn"
    }
}

final class Cows: Animal, BeastProtocol {
    var canMove: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Bò"
    }
}

final class Chicken: Animal, BirdProtocol {
    var canFly: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Gà"
    }
}

final class Duck: Animal, BirdProtocol, BeastProtocol, FishProtocol {
    var canFly: Bool {
        return true
    }
    
    var canMove: Bool {
        return true
    }
    
    var canSwim: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Vịt"
    }
}

final class Shark: Animal, FishProtocol {
    var canSwim: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Cá Mập"
    }
}

final class Pig: Animal, BeastProtocol {
    var canMove: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Heo"
    }
}

final class WaterSeal: Animal, BeastProtocol, FishProtocol {
    var canMove: Bool {
        return true
    }
    
    var canSwim: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Hải Cẩu"
    }
}

final class Bats: Animal, BeastProtocol, BirdProtocol {
    var canMove: Bool {
        return true
    }
    
    var canFly: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Dơi"
    }
}

final class Crocodile: Animal, FishProtocol, BeastProtocol {
    var canSwim: Bool {
        return true
    }
    
    var canMove: Bool {
        return true
    }
    
    override func getName() -> String {
        return "Cá Sấu"
    }
}

var animal: [Animal] = [FlyingFish(), Cows(), Chicken(), Duck(), Shark(), Pig(), WaterSeal(), Bats(), Crocodile()]

private func test() {
    var canFly = Set<String>()
    var canSwim = Set<String>()
    var canMove = Set<String>()
    var temp = Set<String>()
    
    for item in animal {
        if let test = item as? BirdProtocol, test.canFly {
            canFly.insert(item.getName())
        }
        if let test = item as? FishProtocol, test.canSwim {
            canSwim.insert(item.getName())
        }
        if let test = item as? BeastProtocol, test.canMove {
            canMove.insert(item.getName())
        }
    }
    temp = (canMove.symmetricDifference(canSwim)).symmetricDifference(canFly)
    temp.remove("Vịt")
    print("Động vật biết bay là: \(canFly)")
    print("Động vật biết bơi là: \(canSwim)")
    print("Động vật biết đi là: \(canMove)")
    print("Động vật vừa biết đi vừa biết bơi là: \(canMove.intersection(canSwim))")
    print("Động vật vừa biết đi vừa biết bay là: \(canMove.intersection(canFly))")
    print("Động vật vừa biết bay vừa biết bơi là: \(canFly.intersection(canSwim))")
    print("Động vật biết cả 3 là: \((canFly.intersection(canMove)).intersection(canSwim))")
    print("Động vật chỉ biết 1 trong 3 là: \(temp))")
}

test()
