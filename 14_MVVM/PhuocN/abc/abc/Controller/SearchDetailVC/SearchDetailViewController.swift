//
//  SearchDetailViewController.swift
//  abc
//
//  Created by PhuocNguyen on 11/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class SearchDetailViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var loadingData: Bool = false
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
        case .loadData, .loadMore:
            tableView.reloadData()
        } 
    }
    
    override func loadData() {
        viewModel?.loadSearchVideo(loadMore: false) { [weak self] (done, error) in
            guard let self = self else { return }
            self.loadingData = true
            if !done {
                self.showErrorAlert(with: error)
            } else {
                self.updateUI(with: .loadData)
                self.loadingData = false
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
        if let viewModel = viewModel {
            if !loadingData && indexPath.row == viewModel.getCount() - 2 {
                loadingData = true
                viewModel.loadSearchVideo(loadMore: true) { [weak self] done, error  in
                    guard let self = self else { return }
                    if done {
                        self.updateUI(with: .loadMore)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            self.loadingData = false
                        }
                    } else {
                        self.showErrorAlert(with: error)
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        if let viewModel = viewModel {
            detailVC.viewModel = DetailViewModel(video: viewModel.getVideo(at: indexPath.row))
        }
        present(detailVC, animated: true, completion: nil)
    }
}
