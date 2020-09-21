import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var heightBlueButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthBlueButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var heightRedButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthRedButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var heightYellowButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthYellowButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var heightPinkButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthPinkButtonConstraint: NSLayoutConstraint!
    var heightSquare: CGFloat = UIScreen.main.bounds.width * 0.1
    var widthSquare: CGFloat = UIScreen.main.bounds.width * 0.1
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func blueButtonTouchUpInside(_ sender: Any) {
        if blueButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightSquare * 1.5
            widthBlueButtonConstraint.constant = widthSquare * 1.5
            heightRedButtonConstraint.constant = heightSquare
            widthRedButtonConstraint.constant = widthSquare
            heightYellowButtonConstraint.constant = heightSquare
            widthYellowButtonConstraint.constant = widthSquare
            heightPinkButtonConstraint.constant = heightSquare
            widthPinkButtonConstraint.constant = widthSquare
            view.layoutIfNeeded()
            blueButton.isSelected = !blueButton.isSelected
            redButton.isSelected = false
            yellowButton.isSelected = false
            pinkButton.isSelected = false
        }
        else {
            refresh()
            blueButton.isSelected = !blueButton.isSelected
        }
    }

    @IBAction func redButtonTouchUpInside(_ sender: Any) {
        if redButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightSquare
            widthBlueButtonConstraint.constant = widthSquare
            heightRedButtonConstraint.constant = heightSquare * 1.5
            widthRedButtonConstraint.constant = widthSquare * 1.5
            heightYellowButtonConstraint.constant = heightSquare
            widthYellowButtonConstraint.constant = widthSquare
            heightPinkButtonConstraint.constant = heightSquare
            widthPinkButtonConstraint.constant = widthSquare
            view.layoutIfNeeded()
            redButton.isSelected = !redButton.isSelected
            blueButton.isSelected = false
            yellowButton.isSelected = false
            pinkButton.isSelected = false
        } else {
            refresh()
            redButton.isSelected = !redButton.isSelected
        }
    }

    @IBAction func yellowButtonTouchUpInside(_ sender: Any) {
        if yellowButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightSquare
            widthBlueButtonConstraint.constant = widthSquare
            heightRedButtonConstraint.constant = heightSquare
            widthRedButtonConstraint.constant = widthSquare
            heightYellowButtonConstraint.constant = heightSquare * 1.5
            widthYellowButtonConstraint.constant = widthSquare * 1.5
            heightPinkButtonConstraint.constant = heightSquare
            widthPinkButtonConstraint.constant = widthSquare
            view.layoutIfNeeded()
            yellowButton.isSelected = !yellowButton.isSelected
            redButton.isSelected = false
            blueButton.isSelected = false
            pinkButton.isSelected = false
        }
        else {
            refresh()
            yellowButton.isSelected = !yellowButton.isSelected
        }
    }

    @IBAction func pinkButtonTouchUpInside(_ sender: Any) {
        if pinkButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightSquare
            widthBlueButtonConstraint.constant = widthSquare
            heightRedButtonConstraint.constant = heightSquare
            widthRedButtonConstraint.constant = widthSquare
            heightYellowButtonConstraint.constant = heightSquare
            widthYellowButtonConstraint.constant = widthSquare
            heightPinkButtonConstraint.constant = heightSquare * 1.5
            widthPinkButtonConstraint.constant = widthSquare * 1.5
            view.layoutIfNeeded()
            pinkButton.isSelected = !pinkButton.isSelected
            yellowButton.isSelected = false
            redButton.isSelected = false
            blueButton.isSelected = false
        } else {
            refresh()
            pinkButton.isSelected = !pinkButton.isSelected
        }
    }

    func refresh() {
        heightBlueButtonConstraint.constant = heightSquare
        widthBlueButtonConstraint.constant = widthSquare
        heightRedButtonConstraint.constant = heightSquare
        widthRedButtonConstraint.constant = widthSquare
        heightYellowButtonConstraint.constant = heightSquare
        widthYellowButtonConstraint.constant = widthSquare
        heightPinkButtonConstraint.constant = heightSquare
        widthPinkButtonConstraint.constant = widthSquare
    }
}
