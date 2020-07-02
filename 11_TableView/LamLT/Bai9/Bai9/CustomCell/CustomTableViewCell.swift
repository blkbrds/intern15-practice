import UIKit

protocol CustomTableViewCellDelegate: class {
    func customTableView(customTableView: CustomTableViewCell, needPerformAction action: CustomTableViewCell.Action)
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    weak var delegate: CustomTableViewCellDelegate?
    
    enum Action {
        case sendTitle(title: String)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(avatar: String, contactName: String = "", subTitle: String = "") {
        avatarImageView.image = UIImage(named: avatar)
        contactNameLabel.text = contactName
        subTitleLabel.text = subTitle
    }
    
    @IBAction func clickButtonTouchUpInside(_ sender: Any) {
        if let title = contactNameLabel.text {
            delegate?.customTableView(customTableView: self, needPerformAction: .sendTitle(title: title))
            print(title)
        }
        
    }
}
