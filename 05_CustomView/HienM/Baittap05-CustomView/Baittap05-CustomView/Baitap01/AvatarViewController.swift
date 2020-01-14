import UIKit

class AvatarViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	private let userNames: [String] = ["chim", "chuot", "ga", "vit", "heo", "nai", "bo", "trau", "cho", "lon", "chim", "chuot", "ga", "vit", "heo", "nai", "bo", "trau", "cho", "lon", "chim", "chuot", "ga", "vit", "heo", "nai", "bo", "trau", "cho", "lon"]
	private let images: [String] = ["1", "2", "1", "3", "5", "6", "1", "4", "10", "5", "9", "8", "7", "6", "5", "3", "6", "5", "1", "4", "1", "10", "1", "5", "4", "2", "1", "2", "4", "2"]

	override func viewDidLoad() {
		super.viewDidLoad()
		customView()
	}
	private func customView() {
		view.backgroundColor = .green
		scrollView.contentSize = CGSize(width: view.bounds.width, height: 2220)
		var yUserView: CGFloat = 0
		var xUserView: CGFloat = 10
		let widthUserView: CGFloat = 100
		let heightUserView: CGFloat = 130
		let widthScreen = scrollView.bounds.width
		let space: CGFloat = 10

		for index in 0..<userNames.count {
			let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
			let avatar = MyAvatarView(frame: frame)

			avatar.updateUI(imageName: images[index], getUserName: userNames[index])
			avatar.delegate = self
			scrollView.addSubview(avatar)
			// Tinh frame
			if xUserView + widthUserView > widthScreen - xUserView {
				// Thay doi y va x
				yUserView += heightUserView + space
				xUserView = space
			} else {
				xUserView += widthUserView + space
			}
		}
	}
}

extension AvatarViewController: MyAvatarDeligate {
	func nameAvatar(name avatar: String) {
		print(avatar)
	}
}
