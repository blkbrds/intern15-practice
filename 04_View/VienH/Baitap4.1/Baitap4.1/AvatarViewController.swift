import  UIKit

class AvatarViewController: UIViewController {
    
    let names: [String] = ["Hoang Vien", "Nguyen Hong Hanh", "Nguyen Thong", "Tran Duy", "Tran Tien", "123123", "456456", "Tran Bien", "789789"]
    let images: [String] = ["download.jpeg", "download.jpeg", "download.jpeg", "download.jpeg", "download.jpeg", "download.jpeg", "download.jpeg", "download.jpeg", "download.jpeg"]
    
    let spacing: CGFloat = 10
    var heightAvatarView = 160
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var cot = 0
        var dong = 0
        for i in 0..<names.count{
            if i % 3 == 0 && i != 0{
                cot = 0
                dong += 1
            }
            creatAvatarView(x: 20 + ((UIScreen.main.bounds.width - 40 - 2 * spacing) / 3 + spacing) * CGFloat(cot), y: 70 + (160 + spacing) *
                CGFloat(dong), image:images[i], name:names[i])
            cot += 1
            }
        }
    func creatAvatarView(x: CGFloat = 20, y: CGFloat = 70, image: String =
        "Defaultdownload.jpeg", name:String = "user name"){
        let width = ((UIScreen.main.bounds.width - 40) - 2 * spacing) / 3
        let height: CGFloat = 160
        
        let avatarView = UIView(frame: CGRect(x: x, y: y,width: width, height: height ))
        avatarView.layer.borderWidth = 2
        avatarView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(avatarView)
        
        let userAvatar = UIImageView()
        if let img = UIImage(named: image){
            userAvatar.image = img
        }else{
            userAvatar.image = UIImage(named: "Defaultdownload.jpeg")
        }
        userAvatar.frame = CGRect(x:0, y:0, width: avatarView.bounds.width, height:avatarView.bounds.height * 0.8)
        userAvatar.contentMode = .scaleToFill
        userAvatar.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target:self, action: #selector(handleBtn))
        tapGesture.name = name
        userAvatar.addGestureRecognizer(tapGesture)
        avatarView.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x:0, y: userAvatar.bounds.height, width: avatarView.bounds.width, height: avatarView.bounds.height * 0.2 ))
        userName.text = name
        userName.numberOfLines = 0
        userName.font = UIFont.systemFont(ofSize: 12)
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        avatarView.addSubview(userName)
    }
    @objc func handleBtn(_ sender: UIGestureRecognizer){
        guard let name = sender.name else { return }
        print("Click Tai Day ", name)
    }
}
