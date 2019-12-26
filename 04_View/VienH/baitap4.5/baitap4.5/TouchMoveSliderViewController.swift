import UIKit

class TouchMoveSliderViewController: UIViewController {

    @IBOutlet weak var thumbSliderLabel: UILabel!
    @IBOutlet weak var sliderBarView: UIView!
    @IBOutlet weak var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        setupThumbSliderLabel()
        setupViewSlider(view: colorView)
        setupViewSlider(view: sliderBarView)
        if view.tag == 1 {
            print(11111)
            view.frame = CGRect(x: 0, y: 0, width: self.sliderBarView.frame.width, height: sliderBarView.frame.midY)
        }
    }

    func setupViewSlider(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor.green.cgColor

    }

    func setupThumbSliderLabel() {
        thumbSliderLabel.text = "50%"
        thumbSliderLabel.clipsToBounds = true
        thumbSliderLabel.layer.cornerRadius = 20
        thumbSliderLabel.layer.borderWidth = 2
        thumbSliderLabel.layer.borderColor = UIColor.red.cgColor
        thumbSliderLabel.center = CGPoint(x: sliderBarView.frame.midX, y: sliderBarView.frame.midY)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            if position.x >= thumbSliderLabel.frame.minX,
                position.x <= thumbSliderLabel.frame.maxX,
                position.y >= thumbSliderLabel.frame.minY,
                position.y <= thumbSliderLabel.frame.maxY,
                position.y >= sliderBarView.frame.minY,
                position.y <= sliderBarView.frame.maxY { print(99)
                thumbSliderLabel.center = CGPoint(x: sliderBarView.center.x, y: position.y)
                colorView.frame = CGRect(x: 0, y: 0, width: sliderBarView.frame.width, height: thumbSliderLabel.center.y - sliderBarView.frame.origin.y)
                let percentSlider = 100 * (1 - (colorView.frame.height) / (sliderBarView.frame.height))
                thumbSliderLabel.text = "\(Int(percentSlider))%"
            }
        }
    }
}
