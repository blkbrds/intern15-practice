//
//  HomeCollectionViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameAddressLabel: UILabel!
    @IBOutlet weak var addressImageView: UIImageView!
    
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
            addressImageView.image = viewModelCollection.thumnailImage
            nameAddressLabel.text = viewModelCollection.name
            addressLabel.text = viewModelCollection.addres
            distanceLabel.text = String(viewModelCollection.distance) + " km"
            valueLabel.text = viewModelCollection.rating
        } else {
            print("sai roi")
        }
    }
}
