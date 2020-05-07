import UIKit

class HomeView: UIView {

    // MARK: - IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    
    // MARK: - Enum
    enum Action {
        case updateImage
    }
    
    
    
    // MARK: - Properties
       var action: ((Action) -> Void)?
    
    // MARK: - Public Function
    func updatePicture() {
        self.action?(.updateImage)
    }
    
    // MARK: - Action
    @IBAction func backButtonTouchInside(_ sender: Any) {
        
    }
}
