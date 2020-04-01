import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let badgeNumberButton1 = BadgeNumberButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50), viTriLabel: .topRight, text: "10")
        badgeNumberButton1.button?.backgroundColor = .green
        badgeNumberButton1.button?.setTitle("Email", for: .normal)
        view.addSubview(badgeNumberButton1)
        
        let badgeNumberButton2 = BadgeNumberButton(frame: CGRect(x: 100, y: 370, width: 200, height: 50), viTriLabel: .topLeft, text: "99+")
        badgeNumberButton2.button?.backgroundColor = .yellow
        badgeNumberButton2.button?.setTitle("Friends", for: .normal)
        view.addSubview(badgeNumberButton2)
        
        let badgeNumberButton3 = BadgeNumberButton(frame: CGRect(x: 100, y: 440, width: 200, height: 50), viTriLabel: .topCenter, text: "8")
        badgeNumberButton3.button?.backgroundColor = .blue
        badgeNumberButton3.button?.setTitle("Photos", for: .normal)
        view.addSubview(badgeNumberButton3)
    }
}
