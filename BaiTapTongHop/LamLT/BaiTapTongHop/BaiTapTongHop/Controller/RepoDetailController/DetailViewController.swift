//
//  DetailViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit
import RealmSwift

final class DetailViewController: BaseViewController {

    //MARK: Properties
    @IBOutlet weak private var detailTableView: UITableView!
    @IBOutlet weak private var imageView: UIImageView!

    var viewModel: DetailViewModel? {
        didSet {
            if imageView != nil {
                updateUI()
            }
        }
    }

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    //MARK: Override Functions
    override func setUpUI() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        let nib = UINib(nibName: "InforCell", bundle: .main)
        detailTableView.register(nib, forCellReuseIdentifier: "InforCell")

        let nib2 = UINib(nibName: "DescriptionCell", bundle: .main)
        detailTableView.register(nib2, forCellReuseIdentifier: "DescriptionCell")

        let nib3 = UINib(nibName: "RepoCell", bundle: .main)
        detailTableView.register(nib3, forCellReuseIdentifier: "RepoCell")

        configNavi()
    }

    override func setUpData() {
        loadAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configNavi()
    }

    //MARK: Private Functions
    private func loadAPI() {
        viewModel?.loadAPi(apiCompletion: { (done, msg) in
            if done {
                self.detailTableView.reloadData()
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

    private func configNavi() {
        title = "Detail"
        viewModel?.checkFavorites(checkCompletion: { (done, msg) in
            if done {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "star1"), style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
                print(msg)
            } else {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "star2"), style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
                print(msg)
            }
        })
    }
    
    @objc private func rightBarButtonTouchUpInside() {
          if viewModel?.isFavoties == false {
              addToFavorites()
          } else {
              deteleToFavorties()
          }
      }
    
    private func addToFavorites() {
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

    private func deteleToFavorties() {
        viewModel?.deleteFavorites(deleteCompletion: { (done, msg) in
            if done {
                let image = UIImage(named: "star1")
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.rightBarButtonTouchUpInside))
            } else {
                self.showAlert(message: msg)
            }
        })
    }

    private func updateUI() {
        if let image = viewModel?.avatarImage {
            imageView.image = image
        }
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InforCell", for: indexPath) as! InforCell
            cell.viewmodel = viewModel?.inforCellViewModel(at: indexPath)
            return cell

        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            cell.viewmodel = viewModel?.descriptionCellViewModel()
            return cell

        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
            cell.viewmodel = viewModel?.repoCellViewModel(at: indexPath)
            cell.delegate = self
            cell.indexPath = indexPath
            downloadImageDetail(indexPath: indexPath)

            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.titles[section]
    }
}

//MARK: RepoCellDelegate
extension DetailViewController: RepoCellDelegate {
    func downloadImageDetail(indexPath: IndexPath) {
        viewModel?.downloadImageCell(at: indexPath) { (indexPath, image) in
            if let _ = image {
                self.detailTableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}
