import SwiftUI

class ButtonUIView: UIView {
	enum Position {
		case topLeft
		case topRight
		case topCenter
		case centerLeft
		case centerRight
		case bottomLeft
		case bottomRight
		case bottomCenter
	}

	private var button: UIButton = UIButton()
	private var badgeNumberLabel: UILabel = UILabel()
	private var positionBadge: Position

	init(frame: CGRect, positionBadge: Position) {
		self.positionBadge = positionBadge
		super.init(frame: frame)
		addBadgeNumberTextLabel()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addBadgeNumberTextLabel() {
		badgeNumberLabel.frame.size = CGSize(width: 20, height: 20)
		badgeNumberLabel.backgroundColor = .blue
		badgeNumberLabel.text = "13"
		badgeNumberLabel.layer.cornerRadius = 10
		badgeNumberLabel.clipsToBounds = true
		button.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
		button.setTitle("email", for: .normal)
		button.backgroundColor = .orange
		button.layer.cornerRadius = 20
		addSubview(badgeNumberLabel)
		addSubview(button)
		
		switch positionBadge {
		case .topLeft:
			badgeNumberLabel.center = CGPoint(x: 0, y: 0)
		case .topRight:
			badgeNumberLabel.center = CGPoint(x: button.frame.maxX, y: 0)
		case .topCenter:
			badgeNumberLabel.center = CGPoint(x: button.frame.midX, y: 0)
		case .centerLeft:
			badgeNumberLabel.center = CGPoint(x: 0, y: button.frame.midY)
		case .centerRight:
			badgeNumberLabel.center = CGPoint(x: button.frame.maxX, y: button.frame.midY)
		case . bottomRight:
			badgeNumberLabel.center = CGPoint(x: button.frame.maxX, y: button.frame.maxY)
		case .bottomCenter:
			badgeNumberLabel.center = CGPoint(x: button.frame.midX, y: button.frame.maxY)
		case .bottomLeft:
			badgeNumberLabel.center = CGPoint(x: 0, y: button.frame.maxY)
		}
		button.addSubview(badgeNumberLabel)
	}
}
