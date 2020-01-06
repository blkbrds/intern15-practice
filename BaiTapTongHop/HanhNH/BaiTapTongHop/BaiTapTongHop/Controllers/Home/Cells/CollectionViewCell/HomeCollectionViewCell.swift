//
//  HomeCollectionViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate : class {
    func getImageCollection(cell: HomeCollectionViewCell, indexPath: IndexPath?)
}
final class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameAddressLabel: UILabel!
    @IBOutlet weak var addressImageView: UIImageView!

    weak var delageteCollection: HomeCollectionViewCellDelegate?
    var indexPath: IndexPath?
    var viewModelCollection: HomeCellTabelViewModel? {
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
        if let viewModelCollection = viewModelCollection {
            nameAddressLabel.text = viewModelCollection.name
            valueLabel.text = "\(viewModelCollection.forks)"
            distanceLabel.text = "\(viewModelCollection.watchers)"
            addressLabel.text = viewModelCollection.description
            if let image = viewModelCollection.avatar {
                addressImageView.image = image
            } else {
                addressImageView.image = nil
                delageteCollection?.getImageCollection(cell: self, indexPath: indexPath)
            }
        } else {
            print("sai roi")
        }
    }
}
