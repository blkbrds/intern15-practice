//
//  HomeViewController.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit
import RealmSwift

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Function
    private func setupUI() {
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategory))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeCategory))
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func addCategory() {
        let vc =  AddCategoryViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func removeCategory() {
        RealmManager.shared.deleteAllObject(with: viewModel.getCategories()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failture(let error):
                print("error", error.localizedDescription)
            case .sucessful:
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { fatalError("NO Have cell") }
        cell.configUI(category: viewModel.getCategory(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CategoryViewController()
        vc.viewModel = CategoryViewModel(category: viewModel.getCategory(at: indexPath))
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - AddCategoryViewControllerDelegate
extension HomeViewController: AddCategoryViewControllerDelegate {
    func addCategoryToRealm(with object: Category) {
        RealmManager.shared.addObject(with: object) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .sucessful:
                self.tableView.reloadData()
            case .failture(let error):
                print("error", error.localizedDescription)
            }
        }
    }
}
