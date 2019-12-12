
import UIKit

class Ex05ViewController: UIViewController {

    @IBOutlet weak var SliderView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var silderLabel: UILabel!

    let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        SliderView.layer.borderWidth = 1
        SliderView.layer.cornerRadius = 20
        SliderView.layer.borderColor = UIColor.black.cgColor
        silderLabel.layer.cornerRadius = 20
        silderLabel.clipsToBounds = true
        colorView.layer.cornerRadius = 20
        silderLabel.center = CGPoint(x: SliderView.frame.midX, y: SliderView.frame.maxY)
        colorView.frame = CGRect(x: SliderView.frame.maxX, y: SliderView.frame.maxY, width: 0, height: 0)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(Ex05ViewController.handlePan(sender:)))
        silderLabel.addGestureRecognizer(pan)
    }

    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if silderLabel.center.y >= SliderView.frame.minY && silderLabel.center.y + translation.y <= SliderView.frame.maxY {
            silderLabel.center = CGPoint(x: silderLabel.center.x, y: silderLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            colorView.frame = CGRect(x: SliderView.frame.minX, y: silderLabel.center.y, width: SliderView.frame.width, height: SliderView.frame.maxY - silderLabel.center.y)
            silderLabel.text = "\(Int((SliderView.frame.maxY - silderLabel.center.y) / (SliderView.frame.maxY - SliderView.frame.minY) * 100))%"
        }
    }
}


