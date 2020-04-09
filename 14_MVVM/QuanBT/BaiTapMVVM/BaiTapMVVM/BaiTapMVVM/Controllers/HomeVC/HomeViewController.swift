//
//  HomeViewController.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/8/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupUI() {
        super.setupUI()
        title = "Home"
        let nib1 = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib1, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        let nib2 = UINib(nibName: "SliderHomeCell", bundle: .main)
        collectionView.register(nib2, forCellWithReuseIdentifier: "SliderHomeCell")
        collectionView.dataSource = self
    }
    
    override func setupData() {
        super.setupData()
        viewModel.getData()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}
