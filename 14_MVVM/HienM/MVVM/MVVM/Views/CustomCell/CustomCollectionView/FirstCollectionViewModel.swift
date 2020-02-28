import UIKit

final class FirstCollectionViewModel {
	var coffeeImageName: String
	var coffeeName: String
	var addressCoffee: String
	var rating: String
	
	init(image: String, name: String, address: String, rating: String) {
		self.coffeeImageName = image
		self.coffeeName = name
		self.addressCoffee = address
		self.rating = rating
	}
}
