import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var contentCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(contentLabel: String = "") {
        contentCellLabel.text = contentLabel
    }
}
