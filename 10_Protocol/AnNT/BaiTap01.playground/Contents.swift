import UIKit

protocol CanFly {
  var isFly: Bool { set get }
}

protocol CanGo {
  var isGo: Bool { set get }
}

protocol CanSwim {
  var isSwim: Bool { set get }
}

class Animal {
  private var name: String

  func getName() -> String {
    return self.name
  }

  init(name: String) {
    self.name = name
  }
}

class Pet: Animal, CanGo {
  var isGo: Bool

  init(isGo: Bool, name: String) {
    self.isGo = isGo
    super.init(name: name)
  }
}

class Bird: Animal, CanFly, CanSwim, CanGo {
  var isFly: Bool
  var isSwim: Bool
  var isGo: Bool

  init(isFly: Bool, isSwim: Bool, isGo: Bool, name: String) {
    self.isSwim = isSwim
    self.isGo = isGo
    self.isFly = isFly
    super.init(name: name)
  }
}

class Fish: Animal, CanSwim {
  var isSwim: Bool

  init(name: String, isSwim: Bool) {
    self.isSwim = isSwim
    super.init(name: name)
  }
}

let animals: [Animal] = [
  Pet(isGo: true, name: "Meo"),
  Pet(isGo: true, name: "Cho"),
  Fish(name: "Ca qua", isSwim: true),
  Bird(isFly: false, isSwim: true, isGo: true, name: "Chim canh cut"),
  Bird(isFly: true, isSwim: false, isGo: true, name: "Chim chich")
]

class AnimalManager {
  let animals: [Animal]
  
  init(animals: [Animal]) {
    self.animals = animals
  }

  func showAnimalCanFly() {
    for animal in animals {
      if let bird = animal as? Bird, bird.isFly {
        print(bird.getName())
      }
    }
  }
}

//Demo one function
let manager = AnimalManager(animals: animals)
manager.showAnimalCanFly()
