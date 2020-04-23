import UIKit

final class FirstViewController: UIViewController {
	
	@IBOutlet weak private var scrollView: UIScrollView!
	private let widthView: CGFloat = 100
	private let hightView: CGFloat = 170
	private let spacing: CGFloat = 25
	private var spacingtoScrollView: CGFloat = 35
	private var spacingHorizotal: CGFloat = 20
	private let widthScreen = UIScreen.main.bounds.width
	private var names: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
		view.addSubview(scrollView)
		setupUI()
	}

	private func setupUI() {
		
		for index in 0..<33 {
			names.append("name \(index)")

			let userView = Bundle.main.loadNibNamed("AccountView", owner: self, options: nil)?.first as? AccountView
			guard let userView1 = userView else { return }
			let frame = CGRect(x: spacingtoScrollView, y: spacingHorizotal, width: widthView, height: hightView)
			userView1.frame = frame
			spacingtoScrollView += widthView + spacing
			if spacingtoScrollView + 50 > widthScreen {
				spacingtoScrollView = 35
				spacingHorizotal += hightView + 20
			}
			userView?.delegate = self
			scrollView.addSubview(userView1)
			userView1.nameLabel.text = names[index]
			userView1.tag = index
		}
	}
}

extension FirstViewController: AccountViewDelegate {
	func accountView(viewController: UIViewController, value: String) {
		let secondVC = SecondViewController()
		navigationController?.pushViewController(secondVC, animated: true)
		secondVC.name = value
	}
}
