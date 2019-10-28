<<<<<<< HEAD
=======
//
//  HomeViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//
>>>>>>> master

import UIKit

class HomeViewController: BaseViewController {
<<<<<<< HEAD
    @IBOutlet weak var tableView: UITableView!
    var exercises: [Exercise] = []
=======

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var exercises: [Exercise] = []
    
    // MARK: - life cycle
>>>>>>> master
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
<<<<<<< HEAD
=======
    
    // MARK: - config
>>>>>>> master
    override func setupUI() {
        super.setupUI()
        self.title = "Part XXX"
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
<<<<<<< HEAD
    override func setupData() {
        exercises = DataManagement.share.getExercises(fileName: "exercises", type: "plist")
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercises.count
    }
=======
    
    override func setupData() {
        exercises = DataManagement.share.getExercises(fileName: "exercises", type: "plist")
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
>>>>>>> master
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeCell

        let ex = exercises[indexPath.row]
        cell?.titleLabel.text = ex.name
        cell?.subTitleLabel.text = ex.description
<<<<<<< HEAD
        return cell!
    }
=======
        
        return cell!
    }
    
    // MARK: - Table view delegate
>>>>>>> master
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = Ex1ViewController()
            vc.exercise = self.exercises[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex2ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex3ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Ex4ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Ex5ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = Ex6ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = Ex7ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = Ex8ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = Ex9ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            let vc = Ex10ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
<<<<<<< HEAD
        case 10:
            let vc = Ex11ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 11:
            let vc = Ex12ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 12:
            let vc = Ex13ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 13:
            let vc = Ex14ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 14:
            let vc = Ex15ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let alert = UIAlertController(title: "Warning",
                message: "Please, create new View Controller.",
                preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
=======
        default:
            // create the alert
            let alert = UIAlertController(title: "Warning",
                                          message: "Please, create new View Controller.",
                                          preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
>>>>>>> master
            self.present(alert, animated: true, completion: nil)
        }
    }
}







