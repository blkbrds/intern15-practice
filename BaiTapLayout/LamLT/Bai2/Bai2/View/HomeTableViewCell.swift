import UIKit

class HomeTableViewCell: UITableViewCell {
    //MARK : IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var namePersonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    //MARK : - Public Function
    func setUpUI() {
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        avatarImageView.clipsToBounds = true
        
        infoLabel.layer.masksToBounds = false
        infoLabel.layer.cornerRadius = 5
        infoLabel.clipsToBounds = true
    }
}
