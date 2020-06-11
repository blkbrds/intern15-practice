//
//  HomeViewController.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 5/28/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet weak private var repoTableView: UITableView!
    @IBOutlet weak private var collectionView: UICollectionView!

    var viewmodel = HomeModel()
    var isShowTableView: Bool = true

    var titles: [String] = ["Git", "Repositories"]

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isHidden = true
    }

    // MARK: Override func
    override func setUpUI() {
        registerCellTable()
        registerCellCollection()
        configNavi()
    }

    override func setUpData() {
        loadAPI()
        loadGitAPI()
    }

    // MARK: Private Functions
    private func registerCellTable() {
        let nib1 = UINib(nibName: "GitCell", bundle: .main)
        repoTableView.register(nib1, forCellReuseIdentifier: "gitCell")

        let nib2 = UINib(nibName: "HomeCell", bundle: .main)
        repoTableView.register(nib2, forCellReuseIdentifier: "cell")
    }

    private func registerCellCollection() {
        let nib1 = UINib(nibName: "GitCollectionCell", bundle: .main)
        collectionView.register(nib1, forCellWithReuseIdentifier: "gitCellCollection")

        let nib2 = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib2, forCellWithReuseIdentifier: "homeCellCollection")

        let headerNibGit = UINib(nibName: "GitHeader", bundle: .main)
        collectionView.register(headerNibGit, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "gitHeaderCell")

        let headerNibRepo = UINib(nibName: "RepoHeader", bundle: .main)
        collectionView.register(headerNibRepo, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "repoHeaderCell")
    }

    private func configNavi() {
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButtonTouchUpInside))
    }

    private func loadAPI() {
        viewmodel.loadAPi { (done, msg) in
            if done {
                self.updateUI()
            } else {
                self.showAlert(message: msg)
            }
        }
    }

    private func loadGitAPI() {
        viewmodel.loadGitAPI { (done, error) in
            if done {
                self.updateUI()
            } else {
                self.showAlert(message: error)
            }
        }
    }

    private func loadMore() {
        print("call load more")
        viewmodel.loadMoreAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                self.showAlert(message: msg)
            }
        }
    }

    private func updateUI() {
        repoTableView.reloadData()
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Connect API", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Connect", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    //MARK: Action
    @objc private func collectionViewButtonTouchUpInside() {
        if isShowTableView == true {
            isShowTableView = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tableview"), style: .plain, target: self, action: #selector(collectionViewButtonTouchUpInside))
            collectionView.isHidden = false
            collectionView.reloadData()
        } else {
            isShowTableView = true
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButtonTouchUpInside))
            collectionView.isHidden = true
            repoTableView.reloadData()
        }
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewmodel.heightForRowAt(indexPath: indexPath)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "gitCell", for: indexPath) as! GitCell
            cell.delegate = self
            cell.indexPath = indexPath
            cell.viewmodel = viewmodel.gitViewModel(at: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
            cell.delegate = self
            cell.indexPath = indexPath
            cell.viewModel = viewmodel.homeModelForCell(at: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = GitDetailViewController()
            vc.viewModel = viewmodel.detailGitViewModelForCell(at: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 {
            let vc = DetailViewController()
            vc.viewModel = viewmodel.detailViewModelForCell(at: indexPath)
//            vc.repo = viewmodel.getRepoRealm(at: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height * 1.5 {
                loadMore()
            }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height * 1.5 {
            loadMore()
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
}


//MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewmodel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numberOfRowsInSection(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gitCellCollection", for: indexPath) as! GitCollectionCell
            cell.delegate = self
            cell.indexPath = indexPath
            cell.viewmodel = viewmodel.gitViewModel(at: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellCollection", for: indexPath) as! HomeCollectionViewCell
            cell.delegate = self
            cell.indexPath = indexPath
            cell.viewModel = viewmodel.homeModelForCell(at: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = GitDetailViewController()
            vc.viewModel = viewmodel.detailGitViewModelForCell(at: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 1 {
            let vc = DetailViewController()
            vc.viewModel = viewmodel.detailViewModelForCell(at: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 28)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 0 {
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "gitHeaderCell", for: indexPath) as! GitHeader
                reusableview.titleLabel.text = "    Git"
                return reusableview
            } else if indexPath.section == 1 {
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "repoHeaderCell", for: indexPath) as! RepoHeader
                reusableview.titleLabel.text = "    Repositories"
                return reusableview
            }
        default:
            fatalError("Unexpected element kind")
        }
        return UICollectionReusableView()
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 5
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 5
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: (UIScreen.main.bounds.width), height: 65)
        } else if indexPath.section == 1 {
            return CGSize(width: (UIScreen.main.bounds.width - CGFloat(30)) / 2, height: UIScreen.main.bounds.width / 2 + CGFloat(20))
        }
        return CGSize(width: (UIScreen.main.bounds.width - CGFloat(30)) / 2, height: UIScreen.main.bounds.width / 2 + CGFloat(20))
    }
}

//MARK: Implement Protocol
extension HomeViewController: HomeCellDelegate {
    func downloadImage(indexPath: IndexPath) {
        viewmodel.downloadImageCell(at: indexPath) { (indexPath, image) in
            if let _ = image {
                self.repoTableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}

extension HomeViewController: GitCellDelegate {
    func downloadImageForGit(indexPath: IndexPath) {
        viewmodel.downloadGitImageCell(at: indexPath) { (indexPath, image) in
            if let _ = image {
                self.repoTableView.reloadRows(at: [indexPath], with: .none)

            }
        }
    }
}

extension HomeViewController: HomeCollectionCellDelegate {
    func downloadImageForCell(indexPath: IndexPath) {
        viewmodel.downloadImageCell(at: indexPath) { (indexPath, image) in
            if let _ = image {
                self.collectionView.reloadItems(at: [indexPath])
            }
        }
    }
}

extension HomeViewController: GitCollectionCellDelegate {
    func downloadImageForGitCell(indexPath: IndexPath) {
        viewmodel.downloadGitImageCell(at: indexPath) { (indexPath, image) in
            if let _ = image {
                self.collectionView.reloadItems(at: [indexPath])
            }
        }
    }
}
