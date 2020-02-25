import SwiftUI

protocol MyAvatarDeligate: class {
	func nameAvatar(name: String)
}

final class MyAvatarView: UIView {

	var avatarImageView: UIImageView = UIImageView(frame: .zero)
	var nameLabel: UILabel = UILabel(frame: .zero)
	
	weak var delegate: MyAvatarDeligate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		createAvatarView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func createAvatarView() {
		
		avatarImageView.image = UIImage(named: "haha")
		avatarImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 4/5)
		avatarImageView.contentMode = .scaleToFill
		avatarImageView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
		addSubview(avatarImageView)
		
		// create nameLabel
		nameLabel.frame = CGRect(x: 0, y: avatarImageView.frame.height, width: frame.width, height: frame.height * 1 / 5)
		nameLabel.text = "color"
		nameLabel.textAlignment = .center
		nameLabel.textColor = .blue
		nameLabel.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
		addSubview(nameLabel)
		
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
		tapGestureRecognizer.name = nameLabel.text
		nameLabel.isUserInteractionEnabled = true
		nameLabel.addGestureRecognizer(tapGestureRecognizer)
	}

	func updateUI(imageName: String = "", name: String) {
		avatarImageView.image = UIImage(named: imageName)
		nameLabel.text = name
	}

	@objc private func tapGesture(sender: UITapGestureRecognizer) {
		if let userName = nameLabel.text {
			delegate?.nameAvatar(name: userName)
		}
	}

}

