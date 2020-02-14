//
//  HomeViewController.swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    struct Dummy {
        static let heightForTableViewRow: CGFloat = 100
    }

    @IBOutlet private weak var tableView: UITableView!

    let viewModel = HomeViewModel()
    private let customTableViewCell = "CustomTableViewCell"

    override func setupUI() {
        title = "HOME"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "refresh"), style: .plain, target: self, action: #selector(refreshButtonTouchUpInside))
        let cellNib = UINib(nibName: customTableViewCell, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: customTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }

    @objc private func refreshButtonTouchUpInside() {
        viewModel.posts = []
        loadAPI()
    }

    //MARK: - Private functions
    private func loadAPI() {
        print("LOAD API")
        viewModel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }

    private func updateUI() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCell, for: indexPath) as! CustomTableViewCell
        cell.viewModel = viewModel.viewModelForItem(indexPath: indexPath)

        let item = viewModel.thumbnails[indexPath.row]
        Networking.shared().downloadImage(url: item.url) { (image) in
            if let image = image {
                cell.configData(image: image)
            } else {
                cell.configData(image: nil)
            }
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Dummy.heightForTableViewRow
    }
}

extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if(offsetY >= contentHeight + scrollView.frame.height) && !viewModel.isLoading {
            let pageToken = viewModel.nextPageToken
            loadMoreData(pageToken: pageToken)
        }
    }

    func loadMoreData(pageToken: String) {
        if !viewModel.isLoading {
            viewModel.isLoading = true
            viewModel.loadAPI(pageToken: pageToken) { (done, error) in
                if done {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.viewModel.isLoading = false
                    }
                }
            }
        }
    }
}
