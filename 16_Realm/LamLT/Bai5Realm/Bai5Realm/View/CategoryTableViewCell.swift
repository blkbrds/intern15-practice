
import UIKit

protocol CategoryTableViewCellDelegate: class {
    func checkFavorite(isFavorite: Bool)
}

class CategoryTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var fatoriteButton: UIButton!
    @IBOutlet weak var titlePostLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    // MARK: - Properties
    weak var delegate: CategoryTableViewCellDelegate?
    var check: Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Actions
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate {
            delegate.checkFavorite(isFavorite: !check)
        }
    }
}
