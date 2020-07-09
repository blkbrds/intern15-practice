//
//  SliderCollectionViewController.swift
//  CollectionView
//
//  Created by PCI0019 on 7/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var number: [Int] = Array(0...4)
    var images: [UIImage] = [#imageLiteral(resourceName: "calculator"),#imageLiteral(resourceName: "icons8-apple-logo-50"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "calculator"), #imageLiteral(resourceName: "download"), #imageLiteral(resourceName: "icons8-iphone-x-40"), #imageLiteral(resourceName: "icons8-smartphone-tablet-50") ]
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configCollectionView()
    }
    
    func configTableView() {
        let icon = UINib(nibName: "IconTableViewCell", bundle: .main)
        tableView.register(icon, forCellReuseIdentifier: "icon")
        tableView.dataSource = self
        tableView.rowHeight = 100 
    }
    
    func configCollectionView() {
        let cell = UINib(nibName: "SliderCollectionViewCell", bundle: .main)
        collectionView.register(cell, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    @IBAction func backButtonTouchUpInside(_ sender: Any) {
        if currentIndex > 0 {
            currentIndex -= 1
            collectionView.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .right, animated: true)
        }
    }
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        if currentIndex < images.count - 1 {
            currentIndex += 1
            collectionView.scrollToItem(at: IndexPath(row: currentIndex  , section: 0), at: .right, animated: true)
        }
    }
}
extension SliderCollectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "icon", for: indexPath) as? IconTableViewCell else {return UITableViewCell() }
        cell.configTableView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(" Section \(number[section])")
    }
}
extension SliderCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        cell.sliderImageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
}
