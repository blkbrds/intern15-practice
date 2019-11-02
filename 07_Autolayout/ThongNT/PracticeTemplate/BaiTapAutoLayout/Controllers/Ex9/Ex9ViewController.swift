//
//  Ex9ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

struct Car {
    let avatar: String
    let description: String
    let maskColor: UIColor
}

final class Ex9ViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let data: [Car] = [Car(avatar: "car1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", maskColor: .gray),
                       Car(avatar: "car2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat., Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", maskColor: .systemOrange)]
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.alpha = 0.4
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    @IBAction func moveNext(_ sender: Any) {
        index = index + 1
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    override func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Cell")
        collectionView.bounces = false
    }
}

extension Ex9ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.backGroundImageView.image = UIImage(named: data[indexPath.row].avatar)
        cell.maskCellView.backgroundColor = data[indexPath.row].maskColor
        cell.desciptionLabel.text = data[indexPath.row].description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
