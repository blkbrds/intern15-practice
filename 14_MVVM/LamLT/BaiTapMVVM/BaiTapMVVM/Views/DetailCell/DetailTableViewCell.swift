import UIKit

final class DetailTableViewCell: UITableViewCell {

    //MARK: - Outlet
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLable: UILabel!
    @IBOutlet private weak var timeAgoLabel: UILabel!

    //MARK: - Propreties
    var viewModel = DetailCellModel() {
        didSet {
            updateView()
        }
    }

    //MARK: - Override Function
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }

    //MARK: - Private Function
    private func updateView() {
        let dataDetail = viewModel.dataDetail
        avatarImageView.image = UIImage(named: dataDetail.image)
        nameLabel.text = dataDetail.name
        commentLable.text = dataDetail.comment
        timeAgoLabel.text = dataDetail.time
    }
}
