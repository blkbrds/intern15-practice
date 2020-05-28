//
//  HomeViewController.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/21/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DANH SÁCH QUÁN CAFE"
        configTableView()
        configCollectionView()
        viewModel.getDataCafes()
        configNavigationBar()
        collectionView.isHidden = true
    }
    
    private func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
    }
    
    private func configNavigationBar() {
        let delete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonTouchUpInSide))
        navigationItem.leftBarButtonItem = delete
        
//        let edit = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(editButtonTouchUpInSide))
//        navigationItem.rightBarButtonItem = edit
        let edit = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .plain, target: self, action: #selector(editButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = edit
    }
    
    @objc func deleteButtonTouchUpInSide() {
        //Create the alert
        let alert = UIAlertController(title: "Waring", message: "Bạn có chắc xoá", preferredStyle: UIAlertController.Style.alert)
        //add Action
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.viewModel.dataCafes.removeAll()
            self.tableView.reloadData()
        }
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel) { (UIAlertAction) in
            return
        }
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        //show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func editButtonTouchUpInSide() {
//        let addView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView
//        if let addView = addView {
//            addView.frame = CGRect(x: 70, y: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width / 1.5, height: addView.bounds.height)
//            addView.layer.cornerRadius = 20
//            addView.clipsToBounds = true
//            addView.configButton()
//            addView.delegate = self
//            view.addSubview(addView)
//        }
        let editTableView = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(editTableViewButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = editTableView
        collectionView.isHidden = false
    }
    
    @objc func editTableViewButtonTouchUpInSide() {
        collectionView.isHidden = true
        tableView.isHidden = false
        let edit = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2.fill"), style: .plain, target: self, action: #selector(editButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = edit
    }
    
    private func addCaffe(avatar: String, nameTitle: String, address: String) {
        let homeCellVM = HomeCellVM(avatarName: avatar, nameTiltle: nameTitle, address: address)
        viewModel.dataCafes.insert(homeCellVM, at: 0)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSectionCafes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell ?? HomeCell()
        cell.homeCellVM = viewModel.viewModelCellForRow(at: indexPath)
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.dataCafes.remove(at: indexPath.row)
            //Cach xoa cell 1:
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Cach xoa cell 2:
            tableView.reloadData()
        }
    }
}

extension HomeViewController: HomeCellDelegate {
    func homeCell(cell: HomeCell, didSelectRowAt index: Int) {
        let item = viewModel.dataCafes[index].nameTitle
        print("Select \(item)")
    }
}

extension HomeViewController: CustomViewDelegate {
    func customView(view: CustomView, avatar: String, nameTitle: String, address: String) {
        addCaffe(avatar: avatar, nameTitle: nameTitle, address: address)
        tableView.reloadData()
        view.isHidden = true
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSectionCafes()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.homeCollectionViewModel = viewModel.viewModelCellForItem(at: indexPath)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - CGFloat(30)) / 2, height: (UIScreen.main.bounds.width - CGFloat(30)) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
