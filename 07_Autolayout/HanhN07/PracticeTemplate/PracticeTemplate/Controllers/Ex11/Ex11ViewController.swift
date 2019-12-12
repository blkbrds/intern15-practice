
import UIKit

final class Ex11ViewController: UIViewController {

    @IBOutlet weak var constraintHightFourButton: NSLayoutConstraint!
    @IBOutlet weak var constraintHightOneButton: NSLayoutConstraint!
    @IBOutlet weak var constraintHightTowButton: NSLayoutConstraint!
    @IBOutlet weak var constraintHightThreeButton: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func clickTuchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if constraintHightOneButton.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.constraintHightOneButton.constant = 140
                    self.constraintHightTowButton.constant = 70
                    self.constraintHightThreeButton.constant = 70
                    self.constraintHightFourButton.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 1:
            if constraintHightTowButton.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.constraintHightOneButton.constant = 70
                    self.constraintHightTowButton.constant = 140
                    self.constraintHightThreeButton.constant = 70
                    self.constraintHightFourButton.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 2:
            if constraintHightThreeButton.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.constraintHightOneButton.constant = 70
                    self.constraintHightTowButton.constant = 70
                    self.constraintHightThreeButton.constant = 140
                    self.constraintHightFourButton.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 3:
            if constraintHightFourButton.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.constraintHightOneButton.constant = 70
                    self.constraintHightTowButton.constant = 70
                    self.constraintHightThreeButton.constant = 70
                    self.constraintHightFourButton.constant = 140
                    self.view.layoutIfNeeded()
                }
            }
        default:
            break
        }
    }
}
