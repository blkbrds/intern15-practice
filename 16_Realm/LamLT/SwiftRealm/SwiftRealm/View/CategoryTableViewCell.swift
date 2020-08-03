import UIKit

class CategoryTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    var viewmodel = CategoryCellViewModel() {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateView() {
        titleLabel.text = viewmodel.title
        dateLabel.text = viewmodel.date
        typeLabel.text = viewmodel.type
        countLabel.text = "\(viewmodel.count)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
