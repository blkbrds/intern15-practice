import UIKit

protocol MyAvatarDelegate {
    func didTap(name: String)
}

class MyAvatar: UIView {
    var delegate: MyAvatarDelegate?
    var userAvatar: UIImageView?
    var userName: UILabel?
    var button: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //addavtar
        userAvatar = UIImageView(image: UIImage(named: "ronaldo"))
        userAvatar!.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*4/5)
        userAvatar!.contentMode = .scaleToFill
        self.addSubview(userAvatar!)
        
        //addname
        userName = UILabel(frame: CGRect(x: 0, y: frame.size.height*4/5, width: frame.size.width, height: frame.size.height/5))
        userName!.text = "Ronaldo"
        userName!.backgroundColor = .blue
        userName!.textAlignment = .center
        userName!.textColor = .black
        self.addSubview(userName!)
        
        //click avatar
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        button!.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(button!)
    }
    @objc func tap(_ sender: UIButton) {
        if let userName = userName?.text {
            delegate?.didTap(name: userName)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
