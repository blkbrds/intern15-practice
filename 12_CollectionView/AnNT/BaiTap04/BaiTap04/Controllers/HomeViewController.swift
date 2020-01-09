//
//  HomeViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var myTableVIew: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        loadNib()
    }

    private func loadNib() {
        let nib1 = UINib(nibName: "SliderTableViewCell", bundle: .main)
        let nib2 = UINib(nibName: "OtherTableViewCell", bundle: .main)
        myTableVIew.register(nib1, forCellReuseIdentifier: "sliderCell")
        myTableVIew.register(nib2, forCellReuseIdentifier: "otherCell")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return "#Tag \(section)"
        }
        return nil
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell") as! SliderTableViewCell
            cell.backgroundColor = .red
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherCell") as! OtherTableViewCell
            cell.backgroundColor = .red
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 0 {
            return 100
        }
        return 150
    }
}
