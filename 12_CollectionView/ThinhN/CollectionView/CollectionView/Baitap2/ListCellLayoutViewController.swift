//
//  ListCellLayoutViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
class ListCellLayoutViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var height: [CGFloat] = [20, 70, 90, 100, 30,90, 22, 100,50,60, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? HomeLayout {
            layout.dataSource = self
        }
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.register(ImagesCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension ListCellLayoutViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return height.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? ImagesCell else { return UICollectionViewCell() }
        cell.image.image = UIImage(named: "download")
        return cell
    }
}
extension ListCellLayoutViewController: HomeLayoutDataSource {
    func getNumberOfColumn() -> Int {
        return 3
    }
    
    func collectionView(_ controller: UICollectionView, heightForColumnAtIndexPath indexPath: IndexPath) -> CGFloat {
        return height[indexPath.row]
    }
}

class ImagesCell: UICollectionViewCell {
    var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configView() {
        image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        addSubview(image)
    }
}
