import Foundation
import UIKit

final class ScrollCellModel {
	var viewModel: [Place] = Place.DummyData.slidesImage


	func numberItems() -> Int {
		return viewModel.count
	}

	func images() -> [String] {
		return viewModel.map({ $0.image })

	}


	func configData1(at indexPath: IndexPath) -> CustomCollectionViewModel {
		return CustomCollectionViewModel(image: viewModel[indexPath.row].image)
	}
}
