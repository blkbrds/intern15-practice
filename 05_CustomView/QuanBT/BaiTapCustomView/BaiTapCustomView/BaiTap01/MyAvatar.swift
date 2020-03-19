import UIKit

protocol MyAvatarDelegate: class {
    func nameAvatar(name: String)
}

final class MyAvatar: UIView {
    // MARK: - Declare Variable
    private var avatarImageView: UIImageView = UIImageView(frame: .zero)
    private var usernameLabel: UILabel = UILabel(frame: .zero)
    weak var delegate: MyAvatarDelegate?
    
    //MARK: - Override
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private function
    private func setupUIView() {
        avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.8))
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleToFill
        addSubview(avatarImageView)
        
        usernameLabel = UILabel(frame: CGRect(x: 0, y: avatarImageView.frame.height, width: frame.width, height: frame.height * 0.2))
        usernameLabel.text = "Name"
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .white
        usernameLabel.backgroundColor = .blue
        addSubview(usernameLabel)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGestureRecognizer.name = usernameLabel.text
        usernameLabel.isUserInteractionEnabled = true
        usernameLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tapGesture(sender: UITapGestureRecognizer){
        if let username = usernameLabel.text {
            delegate?.nameAvatar(name: username)
        }
    }
    
    func updateUI(imageAvatar: String, getUsername: String) {
        avatarImageView.image  = UIImage(named: imageAvatar)
        usernameLabel.text = getUsername
    }
}

