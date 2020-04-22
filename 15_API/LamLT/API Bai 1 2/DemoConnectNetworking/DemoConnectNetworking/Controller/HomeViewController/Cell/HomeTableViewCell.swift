import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail?.layer.cornerRadius = 10
        thumbnail.layer.shadowColor = UIColor(displayP3Red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
        thumbnail.layer.shadowOffset = CGSize(width: 200, height: 100.75)
        thumbnail.layer.shadowRadius = 110.75
        thumbnail.layer.shadowOpacity = 110.45
        thumbnail.layer.borderWidth = 2
        thumbnail.layer.borderColor = UIColor(displayP3Red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
        thumbnail?.layer.masksToBounds = true
        thumbnail?.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
