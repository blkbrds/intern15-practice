//
//  IconTableViewCell.swift
//  CollectionView
//
//  Created by PCI0019 on 7/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class IconTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionIcon: UICollectionView!
    var images: [UIImage] = [#imageLiteral(resourceName: "calculator"),#imageLiteral(resourceName: "icons8-apple-logo-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "calculator"), #imageLiteral(resourceName: "download"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50")]
    //var icons: [UIImage] = [#imageLiteral(resourceName: "icons8-apple-logo-50"), #imageLiteral(resourceName: "download")]
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configTableView() {
        let nib = UINib(nibName: "IconCollectionViewCell", bundle: .main)
        collectionIcon.register(nib, forCellWithReuseIdentifier: "collectionIcon")
        collectionIcon.dataSource = self
        
    }
    
    
}
extension IconTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIcon", for: indexPath) as! IconCollectionViewCell
        cell.iconView.image = images[indexPath.row]
        return cell
    }
    
}
