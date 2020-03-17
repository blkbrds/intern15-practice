import UIKit

final class MonkeyViewController: UIViewController {
    
    @IBOutlet weak var monkeyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyImageView.image = UIImage(named: "monkey")
    }
    
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        if sender.scale <= 2 && sender.scale >= 0.5 {
            senderView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }
    }
    
    @IBAction func handleRotate(_ sender: UIRotationGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        senderView.transform = senderView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func handleLong(_ sender: UILongPressGestureRecognizer) {
        self.monkeyImageView.transform = .identity
    }
}
