//
//  HomeViewController.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configNavigation()
        viewModel.delegate = self
        viewModel.setupObserve()
        title = "List"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    private func configNavigation() {
        let add = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-add"), style: .plain, target: self, action: #selector(addTouchUpInSide))
        navigationItem.rightBarButtonItem = add
        
        let delete = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-delete"), style: .plain, target: self, action: #selector(deleteTouchUpInSide))
        navigationItem.leftBarButtonItem = delete
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func addTouchUpInSide() {
        let vc = AddViewController()
        vc.delegate = self
        vc.id = viewModel.getNextId()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func deleteTouchUpInSide() {
        let alert = UIAlertController(title: "Waring", message: "Delete All", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.viewModel.delete()
            self.fetchData()
        }
        
        let cancel = UIAlertAction(title: "Cancle", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchData() {
        viewModel.fetchData { (done) in
            if done {
                self.tableView.reloadData()
            } else {
                showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Waring", message: "Error", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            return
        }
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func addInfomation(id: Int, title: String, subTitle: String) {
        viewModel.add(id: id, title: title, subTitle: subTitle)
    }
    
    private func updateInformation(id: Int, title: String, subTitle: String) {
        viewModel.update(id: id, title: title, subTitle: subTitle)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel.viewModelCellForRowAt(indexPath: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ChangeViewController()
        vc.delegate = self
        vc.item = viewModel.getItem(at: indexPath.row)
        vc.viewModel = viewModel.viewModelDidSelectRowAt(indexPath: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: AddViewControllerDelegate {
    func addInfo(view: AddViewController, id: Int, title: String, subTiTle: String) {
        addInfomation(id: id, title: title, subTitle: subTiTle)
        navigationController?.popToRootViewController(animated: true)
    }
}

extension HomeViewController: ChangeViewControllerDelegate {
    func changeInfo(view: ChangeViewController, id: Int, title: String, subTitle: String) {
        updateInformation(id: id, title: title, subTitle: subTitle)
        navigationController?.popToRootViewController(animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func viewModel(viewModel: HomeViewModel, needperfomAction action: HomeViewModel.Action) {
        fetchData()	
    }
}
