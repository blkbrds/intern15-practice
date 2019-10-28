
import UIKit

final class Ex11ViewController: UIViewController {

    @IBOutlet weak var ButtonFourConstraint: NSLayoutConstraint!
    @IBOutlet weak var ButtonOneConstraint: NSLayoutConstraint!
    @IBOutlet weak var ButtonTwoConstraint: NSLayoutConstraint!
    @IBOutlet weak var ButtonThreeConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func click(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if ButtonOneConstraint.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.ButtonOneConstraint.constant = 140
                    self.ButtonTwoConstraint.constant = 70
                    self.ButtonThreeConstraint.constant = 70
                    self.ButtonFourConstraint.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 1:
            if ButtonTwoConstraint.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.ButtonOneConstraint.constant = 70
                    self.ButtonTwoConstraint.constant = 140
                    self.ButtonThreeConstraint.constant = 70
                    self.ButtonFourConstraint.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 2:
            if ButtonThreeConstraint.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.ButtonOneConstraint.constant = 70
                    self.ButtonTwoConstraint.constant = 70
                    self.ButtonThreeConstraint.constant = 140
                    self.ButtonFourConstraint.constant = 70
                    self.view.layoutIfNeeded()
                }
            }
        case 3:
            if ButtonFourConstraint.constant != 140 {
                UIView.animate(withDuration: 0.5) {
                    self.ButtonOneConstraint.constant = 70
                    self.ButtonTwoConstraint.constant = 70
                    self.ButtonThreeConstraint.constant = 70
                    self.ButtonFourConstraint.constant = 140
                    self.view.layoutIfNeeded()
                }
            }
        default:
            break
        }
    }
}
