//
//  ListNumberViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListNumberViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var numbers: [Int] = Array(0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.register(ListNumberCell.self, forCellWithReuseIdentifier: "colectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension ListNumberViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colectionCell", for: indexPath) as? ListNumberCell else { return  UICollectionViewCell()}
        
        cell.label.text = String(numbers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

class ListNumberCell: UICollectionViewCell {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        label.textColor = .red
        label.textAlignment = .center
        addSubview(label)
    }
}
