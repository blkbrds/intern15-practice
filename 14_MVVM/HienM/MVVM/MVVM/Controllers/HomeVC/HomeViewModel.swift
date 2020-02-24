import Foundation
import UIKit

final class HomeViewModel {
	var viewModel: [CofeeRestaurant] = CofeeRestaurant.DummyData.slidesImage
	

	func getNumberObject() -> Int {
		return viewModel.count
	}
	
	func getImages() -> [String] {
		return viewModel.map({ $0.image })
	}

	func getNames() -> [String] {
		return viewModel.map({ $0.name })
	}

	func getAddress() -> [String] {
		return viewModel.map({ $0.address })
	}

	func getRates() -> [String] {
		return viewModel.map({ $0.rate })
	}
	
	func configData1(at indexPath: IndexPath) -> SecondTableViewModel {
		SecondTableViewModel(image: viewModel[indexPath.row].image, name: viewModel[indexPath.row].name, address: viewModel[indexPath.row].address, rating: viewModel[indexPath.row].rate)
	}
	
	func cofigData2(at indexPath: IndexPath) -> FirstCollectionViewModel {
		FirstCollectionViewModel(image: viewModel[indexPath.row].image, name: viewModel[indexPath.row].name, address: viewModel[indexPath.row].address, rating: viewModel[indexPath.row].rate)
	}
}

