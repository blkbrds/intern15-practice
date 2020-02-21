
import Foundation
import UIKit
final class HomeViewModel {
	var viewModel: [Place] = Place.DummyData.slidesImage


	func numberItems() -> Int {
		return viewModel.count
	}

	func images() -> [String] {
		return viewModel.map({ $0.image })

	}
	func names() -> [String] {
		return viewModel.map({ $0.name })
	}

	func rates() -> [String] {
		return viewModel.map({ $0.rate })
	}
	func addresss() -> [String] {
		return viewModel.map({ $0.address })
	}
	
	func configData1(at indexPath: IndexPath) -> SecondCollectionViewModel {
		return SecondCollectionViewModel(image:viewModel[indexPath.row].image, name: viewModel[indexPath.row].name, addressL: viewModel[indexPath.row].address, rateL: viewModel[indexPath.row].rate)
	}
	func configData2(at indexPath: IndexPath) -> HomeTableViewModel {
		return HomeTableViewModel(image:viewModel[indexPath.row].image, name: viewModel[indexPath.row].name, addressL: viewModel[indexPath.row].address, rateL: viewModel[indexPath.row].rate)
	}
}
