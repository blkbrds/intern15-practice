import UIKit

class CustomSliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 170, y: 300, width: 80, height: 400)
        let mySlider = MySliderView(frame: frame)
        view.addSubview(mySlider)
    }



}
