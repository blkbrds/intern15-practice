import UIKit

class MyTableViewCell: UITableViewCell {

	@IBOutlet weak  var cellImage: UIImageView!
	@IBOutlet weak  var nameLabel: UILabel!
	@IBOutlet weak  var subTitleLabel: UILabel!

	 var name: Int?

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	@IBAction private func tapMeButton(_ sender: Any) {
		guard let index = name else { return }
		print("HomeCell->tap me : \(index)")
	}
}
