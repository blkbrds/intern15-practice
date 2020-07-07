//
//  HomeViewController.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewCell()
    }
    
    func configTableViewCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        vc.viewModel = DetailViewModel(caffee: viewModel.caffe[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeViewController: HomeTableViewCellDelegate {
    func passValueToHomeViewController(cell: HomeTableViewCell, isFavorite: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.caffe[indexPath.row].isFavorite = isFavorite
    }
}
