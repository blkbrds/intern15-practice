//
//  HomeViewController.swift
//  ExerciseTabbarController
//
//  Created by PCI0002 on 12/11/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configNavigationBar()
        configCollectionView()
    }
    
    override func setupData() {
        super.setupData()
    }
    
    // MARK: -  Private funcs
    func configNavigationBar() {
        title = "Home"
    }
    
    func configCollectionView() {
        
    }
}
