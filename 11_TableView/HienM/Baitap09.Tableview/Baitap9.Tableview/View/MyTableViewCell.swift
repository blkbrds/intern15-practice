import UIKit

final class MyTableViewCell: UITableViewCell {

	@IBOutlet weak var cellImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var subTitleLabel: UILabel!

	var number: Int?

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	@IBAction private func tapMeButton(_ sender: Any) {
		guard let index = number else { return }
		print("HomeCell->tap me : \(index)")
	}
}
