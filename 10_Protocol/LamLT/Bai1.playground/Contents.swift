import UIKit

class Animal {
    var name: String

    init(name: String) {
        self.name = name
    }

    func nameAnimal() -> String {
        return name
    }
}

protocol CanWalk {
    var isWalk: Bool { get }
}

protocol CanFly {
    var isFly: Bool { get }
}

protocol CanSwin {
    var isSwin: Bool { get }
}

class Mammal: Animal, CanWalk, CanSwin {

    var isWalk: Bool {
        return true
    }

    var isSwin: Bool {
        return true
    }

    override func nameAnimal() -> String {
        return "Name of Mammal is \(name)"
    }
}

class Bird: Animal, CanWalk, CanFly, CanSwin {

    var isWalk: Bool {
        return true
    }

    var isFly: Bool {
        return true
    }

    var isSwin: Bool {
        return true
    }

    override func nameAnimal() -> String {
        return "Name Of Bird is \(name)"
    }
}

class Fish: Animal, CanSwin {

    var isSwin: Bool {
        return true
    }

    override func nameAnimal() -> String {
        return "Name Of Fish is \(name)"
    }
}

var animal1: [Animal] = [Mammal(name: "Bo"), Mammal(name: "Heo"), Mammal(name: "Ngua"), Bird(name: "Bo Cau"), Bird(name: "Edge"), Fish(name: "Shark")]
