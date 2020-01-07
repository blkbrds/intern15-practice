//
//  HomeCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate : class {
    func getImageCollection(cell: HomeCollectionViewCell, indexPath: IndexPath?)
}
final class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var valueLabel: UILabel!
    @IBOutlet weak private var distanceLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var nameAddressLabel: UILabel!
    @IBOutlet weak private var addressImageView: UIImageView!

    weak var delageteCollection: HomeCollectionViewCellDelegate?
    var indexPath: IndexPath?
    var viewModel: HomeCellTableViewModel? {
        //gan du lieu thay doi thi didSet chạy.
        didSet {
            updateCollectionView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateCollectionView() {
        //sau khi didSet chạy thì nó sẽ vào đây lây tất cả dữ liệu, việc tiếp theo là đưa lên.
        if let viewModel = viewModel {
            nameAddressLabel.text = viewModel.name
            valueLabel.text = "\(viewModel.forks)"
            distanceLabel.text = "\(viewModel.watchers)"
            addressLabel.text = viewModel.description
            if let image = viewModel.avatar {
                addressImageView.image = image
            } else {
                addressImageView.image = nil
                delageteCollection?.getImageCollection(cell: self, indexPath: indexPath)
            }
        } else {
            viewModel = nil
        }
    }
}

