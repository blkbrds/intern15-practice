import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageHinh: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add hinh con khỉ
        imageHinh.image = UIImage(named: "conkhi")
    }
    
    @IBAction func zoom(_ sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        if sender.scale <= 2 && sender.scale >= 0.5 {
            senderView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }
    }
    
    
    @IBAction func xoay(_ sender: UIRotationGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        senderView.transform = senderView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    
    @IBAction func nhanGiu(_ sender: UILongPressGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        senderView.transform = .identity
    }
}
