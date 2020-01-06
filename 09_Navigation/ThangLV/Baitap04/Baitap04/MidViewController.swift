import UIKit

class MidViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mid1BarButtonItem = UIBarButtonItem(title: "Mid1", style: .plain,target: self, action: #selector(touchUpInsideMid1BarButtonItem))
        let mid2BarButtonItem = UIBarButtonItem(title: "Mid2", style: .plain, target: self, action: #selector(touchUpInsideMid2BarButtonItem))
        let rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(touchUpInsideRightBarButtonItem))
        navigationItem.leftBarButtonItems = [mid1BarButtonItem, mid2BarButtonItem]
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func touchUpInsideMid1BarButtonItem() {
        
    }
    
    @objc func touchUpInsideMid2BarButtonItem() {
        
    }
    
    @objc func touchUpInsideRightBarButtonItem() {
        
    }

}
