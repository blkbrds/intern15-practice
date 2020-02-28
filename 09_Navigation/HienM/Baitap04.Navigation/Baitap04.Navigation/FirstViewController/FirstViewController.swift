import UIKit

final class FirstViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(pushUpInsideSecondView))
		let bookMarkItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(pushUpInsideSecondView))

		let settingItem = UIBarButtonItem(image: UIImage(named: "setting-icon"), style: .plain, target: self, action: #selector(pushUpInsideSecondView))

		navigationItem.rightBarButtonItems = [searchItem, bookMarkItem, settingItem]
	}
	@objc private func pushUpInsideSecondView() {
		let vc = SecondViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}
