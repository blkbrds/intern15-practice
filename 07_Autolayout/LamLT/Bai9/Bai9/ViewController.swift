
import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var conentView: UITextView!
    
    var index : Int = 0
    var images : [String] = ["1","2","3","4","5","6"]
    var conent : [String] = ["asdasfas","eagaejgjks","wgjntwlkgnw","adklgnadklg","asvasvadgswd","kmdhdklmdfkkn"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureView.image = UIImage(named: images[index])
        conentView.text = conent[index]
    }
    
    @IBAction func nextImage(_ sender: Any) {
        pictureView.image = UIImage(named: images[index + 1])
        conentView.text = conent[index + 1]
        index = index + 1
        if index == images.count - 1 {
            index = 0
        }
    }
    
    @IBAction func backImage(_ sender: Any) {
        if index == 0 {
            index = images.count - 1
        }
        pictureView.image = UIImage(named: images[index - 1])
        conentView.text = conent[index - 1]
        index = index - 1
    }
    
}
