//
//  ViewController.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/1/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategory))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeCategory))
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func addCategory() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "AddCategoryVC") as AddCategoryViewController
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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeTableViewCell else { fatalError("NO Have cell") }
        cell.configUI(category: viewModel.getCategory(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "CategoryVC") as CategoryViewController
        vc.viewModel = CategoryViewModel(category: viewModel.getCategory(at: indexPath))
        navigationController?.pushViewController(vc, animated: true)
    }
}

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
