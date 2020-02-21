import Foundation
import UIKit

final class ScrollCollectionViewCellModel {
	var viewModel: [Place] = Place.DummyData.slidesImage


	func numberItems() -> Int {
		return viewModel.count
	}

	func images() -> [String] {
		return viewModel.map({ $0.image })

	}


	func configData1(at indexPath: IndexPath) -> CollectionViewModel {
		return CollectionViewModel(image: viewModel[indexPath.row].image)
	}
}
