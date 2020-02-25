import UIKit

final class MyViewController: UIViewController {

	private let names: [String] = ["cho", "meo", "vit", "ga", "heo", "bo", "ran", "coc", "cao"]
	private let nameLabel: UILabel = UILabel()
	private let button: UIButton = UIButton()
	let avatarImage: UIImageView = UIImageView()

	func createMyView(frame: CGRect, index: Int) -> UIView {
		let avatarView: UIView = UIView()
		avatarView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
		avatarView.frame = frame

		// create Image
		avatarImage.image = #imageLiteral(resourceName: "icons8-user-male-150 09-09-50-753")
		avatarImage.contentMode = .scaleToFill
		avatarImage.frame = CGRect(x: 0, y: 0, width: avatarView.frame.width, height:
				avatarView.frame.height - 30)
		avatarView.addSubview(avatarImage)

		//create button
		button.frame = avatarView.frame
		let actionButton = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick(_:)))
		actionButton.name = names[index]
		button.backgroundColor = .clear
		button.addGestureRecognizer(actionButton)
		avatarView.addSubview(button)

		//create label
		nameLabel.text = names[index]
		nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 20)
		nameLabel.frame = CGRect(x: 0, y: avatarImage.frame.height + 10, width: avatarImage.frame.width, height: avatarView.frame.height - avatarImage.frame.height - 10)
		nameLabel.textAlignment = .center
		avatarView.addSubview(nameLabel)
		view.addSubview(avatarView)
		return avatarView
	}

	@objc private func buttonDidClick(_ sender: UITapGestureRecognizer) {
		let userName = sender.name
		print("Name User is \(userName ?? "noname")")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		let widthScreen: CGFloat = UIScreen.main.bounds.width
		var marginTop: CGFloat = 60
		let spacing: CGFloat = 40
		var marginHorizontal: CGFloat = 40
		let widthOfView: CGFloat = 80
		let hightOfView: CGFloat = 120

		for index in 0..<names.count {
			_ = createMyView(frame: CGRect(x: marginHorizontal, y: marginTop, width: widthOfView, height: hightOfView), index: index)
			if marginHorizontal + widthOfView > widthScreen - marginHorizontal {
				marginTop += hightOfView + 40
				marginHorizontal = spacing
			} else {
				marginHorizontal += widthOfView + spacing
			}
		}
	}
}
