import UIKit

protocol CustomViewDelegate: class {
    func view(view: CustomView, needPerform action: CustomView.Action)
}

class CustomView: UIView {
    
    enum Action {
        case closeThisCustomView
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var privateLabel: UILabel!
    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var engineerLabel: UILabel!
    weak var delegate: CustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBAction func touchUpInsideCloseButton(_ sender: Any) {
        delegate?.view(view: self, needPerform: CustomView.Action.closeThisCustomView)
    }
}
