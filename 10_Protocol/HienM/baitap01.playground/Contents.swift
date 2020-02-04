import UIKit
protocol CanFly {
	var canFly: Bool { get set }
}

protocol CanGo {
	var canGo: Bool { get set }
}

protocol CanSwim {
	var canSwim: Bool { get set }
}

class Animal {
	var name: String
	init(name: String) {
		self.name = name
	}
	
	func createName() -> String {
		return name
	}
}

class Chim: Animal, CanFly, CanGo, CanSwim {

	var canFly: Bool
	var canGo: Bool
	var canSwim: Bool

	init(canFly: Bool, canGo: Bool, canSwim: Bool, name: String) {
		self.canGo = canGo
		self.canFly = canFly
		self.canSwim = canSwim
		super.init(name: name)
	}
}

class Ca: Animal, CanSwim {

	var canSwim: Bool

	init(canSwim: Bool, name: String) {
		self.canSwim = canSwim
		super.init(name: name)
	}
}

class Thu: Animal, CanSwim, CanGo {

	var canSwim: Bool
	var canGo: Bool

	init(canSwim: Bool, canGo: Bool, name: String) {
		self.canSwim = canSwim
		self.canGo = canGo
		super.init(name: name)
	}
}

let animals: [Animal] = [
	Ca(canSwim: true, name: "Ca Chuon"),
	Ca(canSwim: true, name: "Hai Cau"),
	Ca(canSwim: true, name: "Ca Sau"),
	Chim(canFly: true, canGo: true, canSwim: true, name: "Vit"),
	Chim(canFly: false, canGo: true, canSwim: true, name: "Ga"),
	Thu(canSwim: true, canGo: true, name: "Heo"),
	Thu(canSwim: false, canGo: false, name: "Doi"),
]

func showAnimalCanFly(animal: [Animal]) {
	for animal in animal {
		if let bird = animal as? Chim, bird.canFly {
			print(bird.createName())
		}
	}
}

showAnimalCanFly(animal: animals)




