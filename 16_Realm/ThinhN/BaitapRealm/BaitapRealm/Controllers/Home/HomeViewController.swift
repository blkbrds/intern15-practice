//
//  HomeViewController.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/3/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewmodel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func setupTabbar() {
        let addNewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewButtonTouchUpInside))
        self.navigationItem.rightBarButtonItem = addNewBarButtonItem
        let deleteNewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAllButtonTouchUpInside))
        navigationItem.leftBarButtonItem = deleteNewBarButtonItem
    }
    @objc func addNewButtonTouchUpInside() {
        
    }
    @objc func deleteAllButtonTouchUpInside() {
        
    }
    func addBook(title: String, subTitle: String, price: Int) {
        // tạo realm
        let realm = try! Realm()
        
        // tạo 1 book
        let book = Book()
        book.title = title
        book.subTitle = subTitle
        book.price = price
        
        //realm write
        try! realm.write {
            realm.add(book)
        }
    }
    func fetchData() {
        viewmodel.fetchData { (done) in
            if done {
                self.tableView.reloadData()
            } else {
                print("Lỗi fetch data từ realm")
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeCell else {return UITableViewCell() }
        let book = viewmodel.books[indexPath.row]
        cell.titleNameLabel.text = book.title
        cell.subnameLabel.text = book.subTitle + "\(book.price) vnđ"
        return cell 
    }
    
    
}
