import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageHinh: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageHinh.image = UIImage(named: "conkhi")
        label.isHidden = true
    }
    
    @IBAction func oneTap(_ sender: UITapGestureRecognizer) {
        label.alpha = 1
        label.isHidden = false
        UIView.animate(withDuration: 1, delay: 5, options: [], animations: {
            self.label.alpha = 0
        })
    }
    
    @IBAction func twoTap(_ sender: Any) {
        label.alpha = 1
        label.text = "Khỉ là tôi"
        label.isHidden = false
        UIView.animate(withDuration: 1, delay: 5, options: [], animations: {
            self.label.alpha = 0
        })
    }
}
