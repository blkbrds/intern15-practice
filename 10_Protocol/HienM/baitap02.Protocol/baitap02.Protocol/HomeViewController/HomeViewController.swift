import UIKit

class HomeViewController: UIViewController {

	@IBOutlet private weak var scrollView: UIScrollView!

	private var names: [String] = ["name 1", "name 2", "name 3", "name 4", "name 5", "name 6", "name 7", "name 8", "name 9", "name 10", "name 11", "name 12", "name 13", "name 14", "name 15", "name 16", "name 17", "name 18", "name 19", "name 20", "name 21", "name 22", "name 23", "name 24", "name 25", "name 26", "name 27", "name 28", "name 29", "name 30", "name 31", "name 32", "name 33",]


	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
		view.addSubview(scrollView)
		setupUI()
	}

	var arrayView = [AvatarView]()

	func setupUI() {
		let widthView: CGFloat = 100
		let hightView: CGFloat = 170
		let spacing: CGFloat = 25
		var spacingtoScrollView: CGFloat = 35
		var spacingHorizotal: CGFloat = 20
		let x = scrollView.bounds.width

		for i in 0..<names.count {
			guard let userView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView else { return }
			let frame = CGRect(x: spacingtoScrollView, y: spacingHorizotal, width: widthView, height: hightView)
			userView.frame = frame
			userView.tag = i
			spacingtoScrollView += widthView + spacing
			if spacingtoScrollView + 50 > x {
				spacingtoScrollView = 35
				spacingHorizotal += hightView + 20
			}
			userView.delegate = self
			userView.name = names[i]
			scrollView.addSubview(userView)
			arrayView.append(userView)
		}
	}
}

extension HomeViewController: AvatarViewDeligate {
	func view(view: AvatarView, needPerformAction action: AvatarView.Action) {
		switch action {
		case .nameUser(let nameUser):
			let profileViewController = ProfileViewController()
			profileViewController.name = nameUser
			profileViewController.view.tag = view.tag
			profileViewController.delegate = self
			navigationController?.pushViewController(profileViewController, animated: true)
		}
	}
}

extension HomeViewController: ProfileViewControllerDelegate {
	func controller(controller: ProfileViewController, needPerformAction action: ProfileViewController.Action) {
		switch action {
		case .updateName(let nameUser):
			let index = controller.view.tag
			let arvatarView = arrayView[index]

			arvatarView.name = nameUser
		}
	}
}
