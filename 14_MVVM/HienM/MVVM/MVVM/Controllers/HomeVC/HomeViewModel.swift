import Foundation
import UIKit

class HomeViewModel {
	var slidesImage: [CofeeRestaurant] = CofeeRestaurant.DummyData.slidesImage


	func getNumberObject() -> Int {
		return slidesImage.count
	}

	func getImages() -> [String] {
		return slidesImage.map({ $0.image })
	}

	func getNames() -> [String] {
		return slidesImage.map({ $0.name })
	}

	func getAddress() -> [String] {
		return slidesImage.map({ $0.address })
	}

	func getRates() -> [String] {
		return slidesImage.map({ $0.rate })
	}

	func getDataSecondCell(at indexPath: IndexPath) -> SecondTableViewModel {
		SecondTableViewModel(image: slidesImage[indexPath.row].image, name: slidesImage[indexPath.row].name, address: slidesImage[indexPath.row].address, rating: slidesImage[indexPath.row].rate, favoriteBtnImage: slidesImage[indexPath.row].favorite)
	}

	func getDataFirstView(at indexPath: IndexPath) -> FirstCollectionViewModel {
		FirstCollectionViewModel(image: slidesImage[indexPath.row].image, name: slidesImage[indexPath.row].name, address: slidesImage[indexPath.row].address, rating: slidesImage[indexPath.row].rate)
	}
	func getDataCoffeeView(at indexPath: IndexPath) -> CoffeeCollectionViewModel {
		CoffeeCollectionViewModel(image: slidesImage[indexPath.row].image)
	}

}
