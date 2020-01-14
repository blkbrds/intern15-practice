
import UIKit

class MyViewController: UIViewController {
	@IBOutlet weak var unfavoriteButton: UIButton!
	@IBOutlet weak var favoriteButton: UIButton!

	var favoriteView: FavoriteView!
	override func viewDidLoad() {
		super.viewDidLoad()
		favoriteButton.layer.cornerRadius = 20
		unfavoriteButton.layer.cornerRadius = 20

	}
	override func viewDidAppear(_ animated: Bool) {
		setupUI()
		favoriteView.delegate = self
	}

	private func setupUI() {
		favoriteView = Bundle.main.loadNibNamed("FavoriteView", owner: self, options: nil)?.first as? FavoriteView
		let frame = CGRect(x: 40, y: 150, width: 300, height: 350)
		favoriteView.frame = frame
		favoriteView.layer.cornerRadius = 10
		if let subview = favoriteView {
			view.addSubview(subview)
		}
	}

	@IBAction func actionButton(_ sender: Any) {
		favoriteView?.isHidden = true
	}

	@IBAction func favoriteAction(_ sender: Any) {
		favoriteView?.isHidden = true
	}
}

extension MyViewController: UserViewDelegate {
	func didTap(view: FavoriteView) {
	}
}
