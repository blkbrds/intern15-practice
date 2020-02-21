import Foundation
import UIKit

final class HomeTableViewModel {
	var caffeeImage: String
	var name: String
	var addressL: String
	var rateL: String
	
	init(image: String, name: String, addressL: String, rateL: String) {
		self.caffeeImage = image
		self.name = name
		self.addressL = addressL
		self.rateL = rateL
	}
}
