//
//  DetailViewController.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var detailTableView: UITableView!

//    var users: [Comment] = Comment.getDummyDatas()
    var viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        configData()
    }

    func updateUI() {
        cofigTableView()
    }

    func configData() {
        //load Data
        viewModel.loadData { (done) in
            if done {
                self.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: "Error", message: "Khong Lay duoc DaTa", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    override func setUpNaVi() {
        title = "Nha Cua Hanh"
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "ic-navi-favorites"), style: .plain, target: self, action: #selector(showFavorites))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    @objc func showFavorites() {
        navigationController?.pushViewController(FavoriteViewController(), animated: true)
    }

    func cofigTableView () {
        let nib = UINib(nibName: "DetailTableViewCell", bundle: Bundle.main)
        detailTableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        let nib2 = UINib(nibName: "SliderDetailTableViewCell", bundle: Bundle.main)
        detailTableView.register(nib2, forCellReuseIdentifier: "SliderDetailTableViewCell")
        let nib3 = UINib(nibName: "CommentTableViewCell", bundle: Bundle.main)
        detailTableView.register(nib3, forCellReuseIdentifier: "CommentTableViewCell")
        let nib4 = UINib(nibName: "MapTableViewCell", bundle: Bundle.main)
        detailTableView.register(nib4, forCellReuseIdentifier: "MapTableViewCell")
        detailTableView.dataSource = self
        detailTableView.delegate = self
    }

}
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return viewModel.comment.count
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return UITableView.automaticDimension
        case 2:
            return 150
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "SliderDetailTableViewCell", for: indexPath) as! SliderDetailTableViewCell
            return cell
        case 1:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
            return cell
        case 2:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
            return cell
        default:
            let cell = detailTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            let comment = viewModel.comment[indexPath.row]
            cell.updateDetail(image: comment.avatarImage, status: comment.content, name: comment.name, day: comment.createds)
            return cell
        }
    }
}
