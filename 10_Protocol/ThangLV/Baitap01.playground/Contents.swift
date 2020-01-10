import UIKit

protocol Animal {
    static var isWalk: Bool { get }
    func printName() -> String
}

protocol Bird {
    static var isFly: Bool { get }
    func printName() -> String
}

protocol Fish {
    static var isSwim: Bool { get }
    func printName() -> String
}

class NaturalAnimal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class FlyingFish: NaturalAnimal, Fish, Bird {
    static var isSwim: Bool = true
    static var isFly: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a flying fish"
    }
}

class Cow: NaturalAnimal, Animal {
    static var isWalk: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a cow"
    }
}

class Chicken: NaturalAnimal, Animal, Bird {
    static var isWalk: Bool = true
    static var isFly: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a chicken"
    }
}

class Duck: NaturalAnimal, Animal, Fish, Bird {
    static var isWalk: Bool = true
    static var isSwim: Bool = true
    static var isFly: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a duck"
    }
}

class Shark: NaturalAnimal, Fish {
    static var isSwim: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a baby shark doo doo doo"
    }
}

class Pig: NaturalAnimal, Animal {
    static var isWalk: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a pig"
    }
}

class WaterSeal: NaturalAnimal, Fish, Animal {
    static var isSwim: Bool = true
    static var isWalk: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a water seal"
    }
}

class Bat: NaturalAnimal, Bird, Animal {
    static var isFly: Bool = true
    static var isWalk: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a bat"
    }
}

class Crocodile: NaturalAnimal, Fish, Animal {
    static var isSwim: Bool = true
    static var isWalk: Bool = true
    
    override init(name: String) {
        super.init(name: name)
    }
    
    func printName() -> String {
        return "I am a crocodile"
    }
}

let tara: FlyingFish = FlyingFish(name: "Tara")
let kuro: Cow = Cow(name: "Kuro")
let muno: Chicken = Chicken(name: "Muno")
let donald: Duck = Duck(name: "Donald")
let baby: Shark = Shark(name: "Baby")
let fato: Pig = Pig(name: "Fato")
let toto: WaterSeal = WaterSeal(name: "Toto")
let bingo: Bat = Bat(name: "Bingo")
let mino: Crocodile = Crocodile(name: "Mino")
let animals: [NaturalAnimal] = [tara, kuro, muno, donald, baby, fato, toto, bingo, mino]

private func seekForOneAbility() {
    for animal in animals {
        if animal is Bird && animal is Animal && animal is Fish {
            print("\(animal.name) can fly, walk and swim")
        } else {
            if animal is Bird && animal is Animal {
                print("\(animal.name) can fly and walk")
            } else if animal is Bird && animal is Fish {
                print("\(animal.name) can fly and swim")
            } else if animal is Animal && animal is Fish {
                print("\(animal.name) can walk and swim")
            } else if animal is Bird {
                print("\(animal.name) can only fly")
            } else if animal is Animal {
                print("\(animal.name) can only walk")
            } else {
                print("\(animal.name) can only swim")
            }
        }
    }
}

print(seekForOneAbility())

