//
//  GitDetailViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class GitDetailViewController: BaseViewController {

    //MARK: Properties
    @IBOutlet weak private var tableView: UITableView!

    var viewModel: GitDetailViewModel?

    var titles: [String] = ["Infor Git", "Files"]

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setUpUI() {
        title = "GIT"
        registerTableView()
        configNavi()
    }

    //MARK: Public Function
    func registerTableView() {
        let nib = UINib(nibName: "OwnerCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "ownerCell")

        let nib1 = UINib(nibName: "InforGitCell", bundle: .main)
        tableView.register(nib1, forCellReuseIdentifier: "inforGitCell")

        let nib2 = UINib(nibName: "FileCell", bundle: .main)
        tableView.register(nib2, forCellReuseIdentifier: "fileCell")

        let headerNib = UINib(nibName: "OwnerHeader", bundle: .main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "headerOwner")

        let headerNib1 = UINib(nibName: "InfoGitHeader", bundle: .main)
        tableView.register(headerNib1, forHeaderFooterViewReuseIdentifier: "headerGit")

        let headerNib2 = UINib(nibName: "FileHeader", bundle: .main)
        tableView.register(headerNib2, forHeaderFooterViewReuseIdentifier: "headerFile")
    }

    override func viewDidAppear(_ animated: Bool) {
        configNavi()
    }

    func configNavi() {
        title = "Git Details"
        viewModel?.checkFavorites(checkCompletion: { (done, msg) in
            if done {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "star1"), style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
            } else {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "star2"), style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
            }
        })
    }

    @objc func rightBarButtonTouchUpInside() {
        if viewModel?.isFavoties == false {
            addFavorites()
        } else {
            deleteFavorites()
        }
    }

    private func addFavorites() {
        viewModel?.addFavorites(addCompletion: { (done, msg) in
            if done {
                let image = UIImage(named: "star2")
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
                print(msg)
            } else {
                self.showAlert(message: msg)
            }
        })
    }

    private func deleteFavorites() {
        viewModel?.deleteFavorites(deleteCompletion: { (done, msg) in
            if done {
                let image = UIImage(named: "star1")
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
            } else {
                self.showAlert(message: msg)
            }
        })
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Connect API", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Connect", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension GitDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ownerCell", for: indexPath) as! OwnerCell
            cell.viewmodel = viewModel?.ownerCellViewModel(at: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "inforGitCell", for: indexPath) as! InforGitCell
            cell.viewmodel = viewModel?.inforCellViewModel(at: indexPath)
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as! FileCell
            cell.viewmodel = viewModel?.fileGitViewModel(at: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerOwner") as! OwnerHeader
            headerView.viewModel = viewModel?.headerOwnerViewModel()
            headerView.backgroundColor = .gray
            return headerView
        } else if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerGit") as! InfoGitHeader
            headerView.gitLabel.text = viewModel?.titles[section]
            return headerView
        } else if section == 2 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerFile") as! FileHeader
            headerView.fileLabel.text = viewModel?.titles[section]
            return headerView
        }
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel?.heightForHeaderInSection(section: section) ?? 0
    }
}
