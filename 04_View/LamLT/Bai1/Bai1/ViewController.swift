import UIKit

final class ViewController: UIViewController {
    var xSpacing: CGFloat = 50
    var ySpacing: CGFloat = 100
    var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var imageString: String = "abc"
    var imageNames : [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1..<numbers.count + 1 {
            let frame = CGRect(x: xSpacing, y: ySpacing, width: 100, height: 100)
            let userAvatar = UIImageView(image: UIImage(named: imageString))
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            view.addSubview(userAvatar)

            let frame1 = CGRect(x: xSpacing, y: ySpacing + 100, width: 100, height: 50)
            let userName = UILabel(frame: frame1)
            userName.text = "Name \(numbers[i - 1])"
            userName.backgroundColor = .gray
            userName.textColor = .black
            userName.textAlignment = .center
            view.addSubview(userName)

            let frame2 = CGRect(x: xSpacing, y: ySpacing, width: 100, height: 250)
            let button = UIButton(frame: frame2)
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
            button.tag = i - 1
            view.addSubview(button)
            xSpacing += 120
            if i % 3 == 0 {
                xSpacing = 50
                ySpacing += 200
            }
        }
    }

    @objc func buttonDidClick(_ sender: UIButton) {
        print("OK \(imageNames[sender.tag])")
    }

}
