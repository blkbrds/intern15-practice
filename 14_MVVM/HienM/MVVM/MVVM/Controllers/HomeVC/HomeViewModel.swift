import Foundation
import UIKit

final class HomeViewModel {
	var viewModel: [Object] = Object.DummyData.slidesImage

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
		return viewModel.map({$0.address})
	}
	
	func getRates() -> [String] {
		return viewModel.map({$0.rate})
	}
}

