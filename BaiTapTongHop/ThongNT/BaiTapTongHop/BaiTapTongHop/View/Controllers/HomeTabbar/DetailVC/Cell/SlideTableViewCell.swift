//
//  SlideTableViewCell.swift
//  BaiTapTongHop

import UIKit

final class SlideTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellRegister: String = "SlideImageCollectionViewCell"
    
//    var viewModel: DetailCellViewModel?
    var imageURLs: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func updateUI() {
        collectionView.reloadData()
    }

    func setupUI() {
        collectionView.register(UINib(nibName: cellRegister, bundle: .main), forCellWithReuseIdentifier: cellRegister)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension SlideTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRegister, for: indexPath) as? SlideImageCollectionViewCell else { return UICollectionViewCell() }
        cell.imageString = imageURLs[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

