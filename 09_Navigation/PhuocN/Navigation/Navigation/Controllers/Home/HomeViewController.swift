//
//  HomeViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var exercises: [Exercise] = []
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - config
    override func setupUI() {
        super.setupUI()
        title = "Part 09: Navigation"
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func setupData() {
        exercises = DataManagement.share.getExercises(fileName: "exercises", type: "plist")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeCell else { return UITableViewCell() }
        let ex = exercises[indexPath.row]
        cell.titleLabel.text = ex.name
        cell.subTitleLabel.text = ex.description
        return cell
    }
    
    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = Ex1ViewController()
            vc.exercise = exercises[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = LoginViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ListProfileViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            // create the alert
            let alert = UIAlertController(title: "Warning",
                                          message: "Please, create new View Controller.",
                                          preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            present(alert, animated: true, completion: nil)
        }
    }
}
