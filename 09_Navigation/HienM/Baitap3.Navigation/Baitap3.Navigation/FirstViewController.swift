import UIKit

class FirstViewController: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	let names: [String] = ["name 1", "name 2", "name 3", "name 4", "name 5", "name 6", "name 7", "name 8", "name 9", "name 10", "name 11", "name 12", "name 13", "name 14", "name 15", "name 16", "name 17", "name 18", "name 19", "name 20", "name 21", "name 22", "name 23", "name 24", "name 25", "name 26", "name 27", "name 28", "name 29", "name 30", "name 31", "name 32", "name 33",]

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
		view.addSubview(scrollView)
		setupUI()
	}

	func setupUI() {

		let widthView: CGFloat = 100
		let hightView: CGFloat = 170
		let spacing: CGFloat = 25
		var spacingtoScrollView: CGFloat = 35
		var spacingHorizotal: CGFloat = 20
		let x = scrollView.bounds.width

		for i in 0..<names.count {

			let userView = Bundle.main.loadNibNamed("AccountView", owner: self, options: nil)?.first as? AccountView

			guard let userView1 = userView else { return }

			let frame = CGRect(x: spacingtoScrollView, y: spacingHorizotal, width: widthView, height: hightView)
			userView1.frame = frame

			spacingtoScrollView += widthView + spacing
			if spacingtoScrollView + 50 > x {
				spacingtoScrollView = 35
				spacingHorizotal += hightView + 20
			}
			userView?.delegate = self

			scrollView.addSubview(userView1)
			userView1.nameLabel.text = names[i]
			userView1.tag = i
		}
	}
}

extension FirstViewController: UserViewDeligate {
	func view(view: UIViewController, value: String) {
		let vc = SecondViewController()
		navigationController?.pushViewController(vc, animated: true)

		vc.name = value
	}
}
