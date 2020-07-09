//
//  HomeViewController.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

enum Status {
    case tableView
    case collectionView
}

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var status = Status.tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        configTableViewCell()
        configCollectionViewCell()
        changeView()
    }
    func configTableViewCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    func configCollectionViewCell() {
        let nib2 = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib2, forCellWithReuseIdentifier: "collectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeView() {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.split.3x1"), style: .plain, target: self, action: #selector(changeViewButtonTouchUpInside))
        navigationItem.rightBarButtonItem = barButton
    }
    @objc func changeViewButtonTouchUpInside() {
        if status == .tableView {
            tableView.isHidden = true
            collectionView.isHidden = false
            status = .collectionView
            let barButton = UIBarButtonItem(image: UIImage(systemName: "table"), style: .plain, target: self, action: #selector(changeViewButtonTouchUpInside))
            navigationItem.rightBarButtonItem = barButton
        } else {
            tableView.isHidden = false
            collectionView.isHidden = true
            let barButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.split.3x1"), style: .plain, target: self, action: #selector(changeViewButtonTouchUpInside))
            navigationItem.rightBarButtonItem = barButton
            status = .tableView
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
        cell.viewModel = viewModel.cellForRowAt(indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = DetailViewModel(caffee: viewModel.listCaffe[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func passValueToHomeViewController(cell: HomeTableViewCell, isFavorite: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.listCaffe[indexPath.row].isFavorite = isFavorite
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.viewModel = viewModel.cellForRowAt(indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = DetailViewModel(caffee: viewModel.listCaffe[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeViewController: HomeCollectionViewCellDelegate {
    func passValueToHomeViewController(view: HomeCollectionViewCell, isFavorite: Bool) {
        guard let indexPath = collectionView.indexPath(for: view) else { return }
        viewModel.listCaffe[indexPath.row].isFavorite = isFavorite
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
    }
}
