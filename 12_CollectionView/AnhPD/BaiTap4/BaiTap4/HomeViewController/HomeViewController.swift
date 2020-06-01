//
//  HomeViewController.swift
//  BaiTap4
//
//  Created by PCI0012 on 5/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var numbers: [Int] = []
    var namesFooter: [String] = []
    var location: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configTableView()
        updateNameFooter()
        updateNumbers()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeConllectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func updateNumbers() {
        for index in 1...10 {
            numbers.append(index)
        }
    }
    
    private func updateNameFooter() {
        for index in 1...10 {
            namesFooter.append("End \(index)")
        }
    }
    
    @IBAction func turnRightButtonTouchUpInSide(_ sender: Any) {
        guard location < 9 else {
            return
        }
        location += 1
        collectionView.scrollToItem(at: IndexPath(item: location, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func turnLeftButtonTouchUpInSide(_ sender: Any) {
        guard location >= 1 else {
            return
        }
        location -= 1
        collectionView.scrollToItem(at: IndexPath(item: location, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeConllectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.numberLabel.text = String(numbers[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.bounds.height)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell ?? HomeTableViewCell()
        cell.updateNumbers()
        cell.configCollectionView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "#tag \(section + 1)"
    }
}


