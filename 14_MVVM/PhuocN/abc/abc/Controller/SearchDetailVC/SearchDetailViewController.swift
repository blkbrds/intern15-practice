//
//  SearchDetailViewController.swift
//  abc
//
//  Created by PhuocNguyen on 11/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class SearchDetailViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SearchDetailViewModel?
    enum Action {
        case loadData
        case loadMore
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func setupUI() {
        tableView.register(withNib: FavoriteTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateUI(with action: Action) {
        switch action {
        case .loadData:
            tableView.reloadData()
        case .loadMore:
            tableView.reloadData()
        }
    }
    
    override func loadData() {
        viewModel?.loadSearchVideo(loadMore: false) { [weak self] (done, error) in
            guard let self = self else { return }
            if !done {
                self.showErrorAlert(with: error)
            } else {
                self.tableView.reloadData()
            }
        }
    }
}

//MARK: -tableviewdelgate & datasource
extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FavoriteTableViewCell.self, indexPath: indexPath)
        cell.titleLabel.text = viewModel?.getVideo(at: indexPath.row).title
        cell.channelLabel.text = viewModel?.getVideo(at: indexPath.row).channel
        cell.videoImageView.setImageWith(urlString: (viewModel?.getVideo(at: indexPath.row).imageURL)!, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let viewModel = viewModel, indexPath.row == viewModel.getCount() - 4 {
            viewModel.loadSearchVideo(loadMore: true) { [weak self] done, error  in
                guard let self = self else { return }
                if done {
                    tableView.reloadData()
                } else {
                    self.showErrorAlert(with: error)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
