import Foundation
import UIKit

final class SecondTableViewModel {
	var nameCoffeeImage: String
	var nameCoffee: String
	var addressCoffee: String
	var rating: String
	var favoriteBtnImage: String

	init(image: String, name: String, address: String, rating: String, favoriteBtnImage: String) {
		self.nameCoffeeImage = image
		self.nameCoffee = name
		self.addressCoffee = address
		self.rating = rating
		self.favoriteBtnImage = favoriteBtnImage
	}
}
