
import Foundation
import UIKit

class FirstCollectionViewModel {
	var imageCoffee: String
	var nameCoffee: String
	var addressCoffee: String
	var rating: String
	init(image: String, name: String, address: String, rating: String) {
		self.imageCoffee = image
		self.nameCoffee = name
		self.addressCoffee = address
		self.rating = rating
	}
}
