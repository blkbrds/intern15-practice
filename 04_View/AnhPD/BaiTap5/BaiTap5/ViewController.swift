import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func xuLyPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard  let senderView = sender.view else {
            return
        }
        if senderView.center.y + translation.y >= superView.bounds.minY && senderView.center.y + translation.y <= superView.bounds.maxY {
            senderView.center = CGPoint(x: senderView.center.x, y: senderView.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
            subView.frame = CGRect(x: 0, y: label.center.y, width: 20, height: superView.bounds.maxY - label.center.y)
            let temp = (subView.bounds.height / superView.bounds.height) * 100
            label.text = "\(Int(temp))"
        }
    }
}
