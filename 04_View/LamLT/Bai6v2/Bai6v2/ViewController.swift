import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(recognizer:)))
        print("qwe")
        imageView.addGestureRecognizer(rotateGesture)
        print("qwe")
    }

    @objc private func handleRotate(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
        print("qwe")
    }
}
