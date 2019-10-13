//
//  HomeViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var exercise: [Exercise] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = "Auto Layout"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func setupData() {
        exercise = DataManagement.share.getExercises(fileName: "exercises", type: "plist")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Table view datasource & delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeCell
        cell?.titleLabel.text = exercise[indexPath.row].name
        cell?.subTitleLabel.text = exercise[indexPath.row].description
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = Ex1ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex2ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex3ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Ex4ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Ex5ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = Ex6ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = Ex7ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = Ex8ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = Ex9ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = Ex10ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 10:
            let vc = Ex11ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = Ex12ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = Ex13ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = Ex14ViewController()
            vc.exercise = self.exercise[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        default:
            // create the alert
            let alert = UIAlertController(title: "Warning",
                                          message: "Please, create new View Controller.",
                                          preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
