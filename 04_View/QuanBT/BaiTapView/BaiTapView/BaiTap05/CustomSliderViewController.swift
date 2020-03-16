import UIKit

final class CustomSliderViewController: UIViewController {
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor.blue.cgColor
        blueView.layer.borderWidth = 1
        blueView.layer.borderColor = UIColor.blue.cgColor
        sliderView.layer.borderWidth = 1
        sliderView.layer.borderColor = UIColor.brown.cgColor
        sliderView.layer.cornerRadius = 25
    }
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else {
            return
        }
        if gestureView.center.y + translation.y >= whiteView.frame.minY &&
            gestureView.center.y + translation.y <= whiteView.frame.maxY {
            gestureView.center = CGPoint(
                x: gestureView.center.x,
                y: gestureView.center.y + translation.y
            )
            gesture.setTranslation(.zero, in: view)
        
            blueView.frame = CGRect(x:192, y: sliderView.center.y, width: 30, height: blueView.frame.maxY - sliderView.center.y)
            let temp = (blueView.frame.maxY - sliderView.center.y) / 400 * 100
            label.text = "\(Int(temp))"
        } else if gestureView.center.y + translation.y == whiteView.frame.minY {
            label.text = "0"
        } else if gestureView.center.y + translation.y == whiteView.frame.maxY - 10  {
            label.text = "100"
        }
    }
}
