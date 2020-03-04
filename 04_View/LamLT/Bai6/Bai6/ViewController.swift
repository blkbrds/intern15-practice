import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var ruaViewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(recognizer:)))
        let pindGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        tapGesture.numberOfTapsRequired = 1
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(recognizer:)))
        doubleTapGesture.numberOfTapsRequired = 2
        ruaViewImage.addGestureRecognizer(rotateGesture)
        ruaViewImage.addGestureRecognizer(pindGesture)
        messageLabel.text = "I Am Turtle"
        messageLabel.isHidden = true
        ruaViewImage.addGestureRecognizer(tapGesture)
        ruaViewImage.addGestureRecognizer(doubleTapGesture)
    }
    
    @objc private func handleRotate(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func handlePinch(recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        messageLabel.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            UIView.animate(withDuration: 3) {
                self.messageLabel.alpha = 0
                self.messageLabel.isHidden = true
            }
        }
    }
    
    @objc func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        messageLabel.isHidden = false
        messageLabel.text = "Turtle It me"
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            UIView.animate(withDuration: 3) {
                self.messageLabel.alpha = 0
                self.messageLabel.isHidden = true
            }
        }
    }
}
