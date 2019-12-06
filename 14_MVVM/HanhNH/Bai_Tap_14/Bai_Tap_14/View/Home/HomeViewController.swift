//
//  HomeViewController.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var address: [Address] = Address.getDummyDatas()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    override func setUpNaVi() {
        title = "Home"
    }
    
    func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
    }
}
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.updateTabViewCell(avatar: address[indexPath.row].avatarImage, name: address[indexPath.row].nameImage, distance: address[indexPath.row].distance, value: address[indexPath.row].value, address: address[indexPath.row].address)
        return cell
        
    }
}


