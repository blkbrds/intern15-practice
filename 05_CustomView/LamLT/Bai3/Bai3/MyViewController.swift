import UIKit

class MyViewController: UIViewController {
    var xSpacing = 30
    var ySpacing = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 50, y: 50, width: 150, height: 200)
        let frame1 = CGRect(x: 50, y: 200, width: 150, height: 200)
        let frame2 = CGRect(x: 50, y: 350, width: 150, height: 200)
        let buttonView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?[0] as? MyView
        buttonView?.frame = frame
        buttonView?.emailButton.layer.masksToBounds = false
        buttonView?.emailButton.layer.cornerRadius = 25
        buttonView?.emailButton.clipsToBounds = true
        buttonView?.badgeEmailLabel.layer.masksToBounds = false
        buttonView?.badgeEmailLabel.layer.cornerRadius = 5
        buttonView?.badgeEmailLabel.clipsToBounds = true
        view.addSubview(buttonView!)
        
        let buttonView1 = Bundle.main.loadNibNamed("MyView2", owner: self, options: nil)?[0] as? MyView
        buttonView1?.frame = frame1
        buttonView1?.friendButton.layer.masksToBounds = false
        buttonView1?.friendButton.layer.cornerRadius = 25
        buttonView1?.friendButton.clipsToBounds = true
        buttonView1?.badgeFriendLabel.layer.masksToBounds = false
        buttonView1?.badgeFriendLabel.layer.cornerRadius = 10
        buttonView1?.badgeFriendLabel.clipsToBounds = true
        view.addSubview(buttonView1!)
        
        let buttonView2 = Bundle.main.loadNibNamed("MyView3", owner: self, options: nil)?[0] as? MyView
        buttonView2?.frame = frame2
        buttonView2?.photosButton.layer.masksToBounds = false
        buttonView2?.photosButton.layer.cornerRadius = 25
        buttonView2?.photosButton.clipsToBounds = true
        buttonView2?.badgePhotoLabel.layer.masksToBounds = false
        buttonView2?.badgePhotoLabel.layer.cornerRadius = 18
        buttonView2?.badgePhotoLabel.clipsToBounds = true
        view.addSubview(buttonView2!)
    }

}
