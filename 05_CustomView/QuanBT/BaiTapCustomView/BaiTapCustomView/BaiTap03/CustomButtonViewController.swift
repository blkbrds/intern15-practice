import UIKit

class CustomButtonViewController: UIViewController {
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    // MARK: - Private function
    private func setupView(){
        let buttonBadgeNumber1 = BadgeNumberButton(frame: CGRect(x: 100, y: 200, width: 200, height: 100), pointBadgeNumber: .TopRight, text: "10")
        buttonBadgeNumber1.button?.backgroundColor = .green
        buttonBadgeNumber1.button?.setTitle("Email", for: .normal)
        view.addSubview(buttonBadgeNumber1)
        
        let buttonBadgeNumber2 = BadgeNumberButton(frame: CGRect(x: 100, y: 400, width: 200, height: 100), pointBadgeNumber: .TopLeft, text: "99+")
               buttonBadgeNumber2.button?.backgroundColor = .yellow
               buttonBadgeNumber2.button?.setTitle("Friends", for: .normal)
               view.addSubview(buttonBadgeNumber2)

        let buttonBadgeNumber3 = BadgeNumberButton(frame: CGRect(x: 100, y: 600, width: 200, height: 100), pointBadgeNumber: .TopCenter, text: "8")
        buttonBadgeNumber3.button?.backgroundColor = .purple
        buttonBadgeNumber3.button?.setTitle("Photos", for: .normal)
        view.addSubview(buttonBadgeNumber3)
    }
}
