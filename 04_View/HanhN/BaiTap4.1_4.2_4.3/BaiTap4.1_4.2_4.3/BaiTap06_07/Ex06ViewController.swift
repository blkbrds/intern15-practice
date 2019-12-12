
import UIKit

final class Ex06ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var commentLable: UILabel!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var mokeyImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    private func configView() {
        mokeyImageView.isUserInteractionEnabled = true
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        pinch.delegate = self
        mokeyImageView.addGestureRecognizer(pinch)

        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        rotate.delegate = self
        mokeyImageView.addGestureRecognizer(rotate)

        let longPressed = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressed.minimumPressDuration = 5
        longPressed.delaysTouchesBegan = true
        longPressed.delegate = self
        mokeyImageView.addGestureRecognizer(longPressed)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(comment))
        tapGesture.numberOfTapsRequired = 1
        mokeyImageView.addGestureRecognizer(tapGesture)

        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubuleComment))
        doubleTapGesture.numberOfTapsRequired = 2
        mokeyImageView.addGestureRecognizer(doubleTapGesture)
    }

    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        }
    }

    @objc func handleRotate(sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = ((sender.view?.transform.rotated(by: sender.rotation))!)
            sender.rotation = 0
        }
    }

    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            mokeyImageView.transform = .identity
        }
    }

    @objc func comment(seder: UITapGestureRecognizer) {
        commentLable.text = "toi khi la "
        commentImageView.alpha = 1
        commentLable.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in UIView.animate(withDuration: 1) {
                self.commentImageView.alpha = 0
                self.commentLable.alpha = 0
            }

        }
    }

    @objc func doubuleComment(seder: UITapGestureRecognizer)
    {
        commentLable.text = "khi la toi"
        commentImageView.alpha = 1
        commentLable.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in UIView.animate(withDuration: 1) {
                self.commentImageView.alpha = 0
                self.commentLable.alpha = 0
            }
        }
        print("hhahhahahahahah")
    }
}
