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
    
    var cafes: [HomeCellVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DANH SÁCH QUÁN CAFE"
        configTableView()
        loadData()
        configNavigationBar()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist"), let sectionsData = NSDictionary(contentsOf: path) else {
            return
        }
        
        if let caffes = sectionsData["Caffes"] as? [[String: Any]] {
            var homeCellVMs: [HomeCellVM] = []
            caffes.forEach { caffe in
                let avatarName: String = caffe["avatarName"] as? String ?? ""
                let nameTitle: String = caffe["nameTitle"] as? String ?? ""
                let address: String = caffe["address"] as? String ?? ""
                let homeCellVM = HomeCellVM(avatarName: avatarName, nameTiltle: nameTitle, address: address)
                homeCellVMs.append(homeCellVM)
            }
            cafes.append(contentsOf: homeCellVMs)
        }
    }
    
    private func configNavigationBar() {
        let delete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonTouchUpInSide))
        navigationItem.leftBarButtonItem = delete
        
        let edit = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(editButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = edit
    }
    
    @objc func deleteButtonTouchUpInSide() {
        //Create the alert
        let alert = UIAlertController(title: "Waring", message: "Bạn có chắc xoá", preferredStyle: UIAlertController.Style.alert)
        //add Action
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.cafes.removeAll()
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
        let addView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView
        if let addView = addView {
            addView.frame = CGRect(x: 70, y: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width / 1.5, height: addView.bounds.height)
            addView.layer.cornerRadius = 20
            addView.clipsToBounds = true
            addView.configButton()
            addView.delegate = self
            view.addSubview(addView)
        }
    }
    
    private func addCaffe(avatar: String, nameTitle: String, address: String) {
        let homeCellVM = HomeCellVM(avatarName: avatar, nameTiltle: nameTitle, address: address)
        cafes.insert(homeCellVM, at: 0)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell ?? HomeCell()
        cell.homeCellVM = cafes[indexPath.row]
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cafes.remove(at: indexPath.row)
            //Cach xoa cell 1:
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Cach xoa cell 2:
            tableView.reloadData()
        }
    }
}

extension HomeViewController: HomeCellDelegate {
    func homeCell(cell: HomeCell, didSelectRowAt index: Int) {
        let item = cafes[index].nameTitle
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
