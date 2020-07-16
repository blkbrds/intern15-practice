//
//  HomeViewController.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

enum ViewMode {
    case list
    case grid
}

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var status = ViewMode.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        configTableViewCell()
        configCollectionViewCell()
        configNavigationBar()
    }
    
    func configTableViewCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configCollectionViewCell() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configNavigationBar() {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.split.3x1"), style: .plain, target: self, action: #selector(changeViewButtonTouchUpInside))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeViewButtonTouchUpInside() {
        switch status {
        case .list:
            tableView.isHidden = true
            collectionView.isHidden = false
            status = .grid
            let barButton = UIBarButtonItem(image: UIImage(systemName: "table"), style: .plain, target: self, action: #selector(changeViewButtonTouchUpInside))
            navigationItem.rightBarButtonItem = barButton
        case .grid:
            tableView.isHidden = false
            collectionView.isHidden = true
            let barButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.split.3x1"), style: .plain, target: self, action: #selector(changeViewButtonTouchUpInside))
            navigationItem.rightBarButtonItem = barButton
            status = .list
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.viewModel = viewModel.viewModelForCellAt(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = DetailViewModel(cafe: viewModel.listCafes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func cell(_ cell: HomeTableViewCell, needPerforms action: HomeTableViewCell.Action) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.listCafes[indexPath.row].isFavorite = true 
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.viewModel = viewModel.viewModelForCellAt(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = DetailViewModel(cafe: viewModel.listCafes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func cell(_ cell: HomeCollectionViewCell, needPerforms action: HomeTableViewCell.Action) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        viewModel.listCafes[indexPath.row].isFavorite = true
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
    }
}
