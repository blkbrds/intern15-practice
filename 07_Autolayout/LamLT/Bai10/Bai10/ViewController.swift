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
    var heightH: CGFloat = UIScreen.main.bounds.width * 0.1
    var widthW: CGFloat = UIScreen.main.bounds.width * 0.1
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func blueButtonClick(_ sender: Any) {
        if blueButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightH * 1.5
            widthBlueButtonConstraint.constant = widthW * 1.5
            heightRedButtonConstraint.constant = heightH
            widthRedButtonConstraint.constant = widthW
            heightYellowButtonConstraint.constant = heightH
            widthYellowButtonConstraint.constant = widthW
            heightPinkButtonConstraint.constant = heightH
            widthPinkButtonConstraint.constant = widthW
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

    @IBAction func redButtonClick(_ sender: Any) {
        if redButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightH
            widthBlueButtonConstraint.constant = widthW
            heightRedButtonConstraint.constant = heightH * 1.5
            widthRedButtonConstraint.constant = widthW * 1.5
            heightYellowButtonConstraint.constant = heightH
            widthYellowButtonConstraint.constant = widthW
            heightPinkButtonConstraint.constant = heightH
            widthPinkButtonConstraint.constant = widthW
            view.layoutIfNeeded()
            redButton.isSelected = !redButton.isSelected
            blueButton.isSelected = false
            yellowButton.isSelected = false
            pinkButton.isSelected = false
        }
        else {
            refresh()
            redButton.isSelected = !redButton.isSelected
        }
    }

    @IBAction func yellowButtonClick(_ sender: Any) {
        if yellowButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightH
            widthBlueButtonConstraint.constant = widthW
            heightRedButtonConstraint.constant = heightH
            widthRedButtonConstraint.constant = widthW
            heightYellowButtonConstraint.constant = heightH * 1.5
            widthYellowButtonConstraint.constant = widthW * 1.5
            heightPinkButtonConstraint.constant = heightH
            widthPinkButtonConstraint.constant = widthW
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

    @IBAction func pinkButtonClick(_ sender: Any) {
        if pinkButton.isSelected == false {
            heightBlueButtonConstraint.constant = heightH
            widthBlueButtonConstraint.constant = widthW
            heightRedButtonConstraint.constant = heightH
            widthRedButtonConstraint.constant = widthW
            heightYellowButtonConstraint.constant = heightH
            widthYellowButtonConstraint.constant = widthW
            heightPinkButtonConstraint.constant = heightH * 1.5
            widthPinkButtonConstraint.constant = widthW * 1.5
            view.layoutIfNeeded()
            pinkButton.isSelected = !pinkButton.isSelected
            yellowButton.isSelected = false
            redButton.isSelected = false
            blueButton.isSelected = false
        }
        else {
            refresh()
            pinkButton.isSelected = !pinkButton.isSelected
        }
    }

    func refresh() {
        heightBlueButtonConstraint.constant = heightH
        widthBlueButtonConstraint.constant = widthW
        heightRedButtonConstraint.constant = heightH
        widthRedButtonConstraint.constant = widthW
        heightYellowButtonConstraint.constant = heightH
        widthYellowButtonConstraint.constant = widthW
        heightPinkButtonConstraint.constant = heightH
        widthPinkButtonConstraint.constant = widthW

    }
}
