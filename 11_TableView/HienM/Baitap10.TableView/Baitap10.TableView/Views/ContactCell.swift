import UIKit

class ContactCell: UITableViewCell {

	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var phoneNumberLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	@IBAction func callButtonTap(_ sender: Any) {
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}
