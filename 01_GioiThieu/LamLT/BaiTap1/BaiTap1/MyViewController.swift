
import UIKit

final class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

    private func getRandomColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1)
    }

    @IBAction private func changeColorButtonTouchUpInside(_ sender: Any) {
        getRandomColor()
    }
}
