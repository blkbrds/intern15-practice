import UIKit

class ViewController: UIViewController, MyAvatarDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let name: [String] = ["anh","binh","cong","dat","em","phuoc","giang","hiep","quoc","quang","tien","ro","thuy","yen","uyen","long","son","phong","truong","tung","khoan","linh","hoang","hung","viet","man","ninh","dieu","ly","luan"]
    let image: [String] = Array(repeating: "ronaldo", count: 30)
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        var toaDoX = 35
        var toaDoY = 100
        
        for i in 0..<30 {
        let avatar = MyAvatar(frame: CGRect(x: toaDoX, y: toaDoY, width: 100, height: 125))
        avatar.userName!.text = name[i]
        toaDoX += 130
        if (i + 1) % 3 == 0 {
            toaDoY += 150
            toaDoX = 35
            }
        avatar.delegate = self
        scrollView.addSubview(avatar)
        }

        // Do any additional setup after loading the view.
    }
    func didTap(name: String) {
        print("\(name)")
    }
}
