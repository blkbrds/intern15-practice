import SwiftUI
protocol UserViewDelegate {
	func didTap(view: FavoriteView
	)
}
class FavoriteView: UIView {
	var delegate: UserViewDelegate?

	@IBAction func closeButton(_ sender: Any) {
		self.isHidden = true
	}
}






