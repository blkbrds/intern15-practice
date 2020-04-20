import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLable: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!

    var viewModel = DetailCellModel() {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    private func updateView() {
        let dataDetail = viewModel.dataDetail
        avatarImageView.image = UIImage(named: dataDetail.image)
        nameLabel.text = dataDetail.name
        commentLable.text = dataDetail.comment
        timeAgoLabel.text = dataDetail.time
    }
}
