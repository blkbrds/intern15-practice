import UIKit

class BadgeNumberButton: UIView {
    // MARK: - Declare Variable
    var button: UIButton = UIButton()
    private var badgeNumberLabel = UILabel()
    private var pointBadgeNumber: BadgeNumber
    private var text: String = ""
    
    enum BadgeNumber {
        case topLeft
        case topCenter
        case topRight
        case centerRight
        case bottomRight
        case bottomCenter
        case bottomLeft
        case centerLeft
    }
    
    init(frame: CGRect, pointBadgeNumber: BadgeNumber, text: String) {
        self.pointBadgeNumber = pointBadgeNumber
        self.text = text
        super.init(frame: frame)
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.setTitle("text", for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 0.5
        addSubview(button)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private function
    private func setupUI(){
        let temp = 20 + text.count * 10
        badgeNumberLabel.frame.size = CGSize(width: temp, height: 30)
        badgeNumberLabel.text = text
        badgeNumberLabel.textColor = .white
        badgeNumberLabel.backgroundColor = .red
        badgeNumberLabel.layer.cornerRadius = 10
        badgeNumberLabel.clipsToBounds = true
        badgeNumberLabel.textAlignment = .center
        badgeNumberLabel.numberOfLines = 0
        
        switch pointBadgeNumber {
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
        case .bottomRight:
            badgeNumberLabel.center = CGPoint(x: button.frame.maxX, y: button.frame.maxY)
        case .bottomCenter:
            badgeNumberLabel.center = CGPoint(x: button.frame.midX, y: button.frame.maxY)
        case .bottomLeft:
            badgeNumberLabel.center = CGPoint(x: 0, y: button.frame.maxY)
        }
        
        if text != "0" {
            addSubview(badgeNumberLabel)
        }
    }
}