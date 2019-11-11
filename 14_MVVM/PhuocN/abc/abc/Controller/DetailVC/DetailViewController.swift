//
//  DetailViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import WebKit
import RealmSwift

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var webKit: WKWebView!
    @IBOutlet weak var maskView: UIView!
    
    var notificationToken: NotificationToken?
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        changeValueFromRealm()
        guard let viewModel = viewModel else { return }
        playVideo(videoId: viewModel.videoId)
    }
    
    func changeValueFromRealm() {
        let result = RealmManager.shared.realm.objects(PlayList.self)
        notificationToken = result.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            switch changes {
            case .initial:
                break
            case .update(_, _, _, _):
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    override func loadData() {
        guard let viewModel = viewModel else { return }
        viewModel.loadComment(loadMore: false) { [weak self] (done, error) in
            guard let self = self else { return }
            if done {
                self.tableView.reloadData()
            }
        }
        viewModel.checkRating { (done, error) in
            if done {
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
            }
        }
    }
    
    override func setupUI() {
        maskView.isHidden = true
        tableView.register(withNib: CommentTableViewCell.self)
        tableView.register(withNib: RatingTableViewCell.self)
        tableView.register(with: UITableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func playVideo(videoId: String) {
        viewModel?.playVideo(completion: { [weak self] (done, error, request) in
            guard let self = self else { return }
            if done {
                guard let request = request else { return }
                self.webKit.load(request)
            } else {
                self.showErrorAlert(with: "Can not load this video")
            }
        })
    }
    
    @objc private func likeBarButton() {
//        viewModel?.changePlayList(completion: { [weak self] done in
//            guard let self = self else { return }
//            if !done {
//                self.showErrorAlert(with: "Can not like this video")
//            }
//        })
    }
    
    //    deinit {
    //        self.notificationToken?.invalidate()
    //    }
    
    func showHUB() {
        maskView.isHidden = false
    }
    
    func endHUB() {
        maskView.isHidden = true
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.getNumberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.titleOfSection(for: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberRowOfSection(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(with: CommentTableViewCell.self, indexPath: indexPath)
            cell.nameAuthLabel.text = viewModel?.getComment(at: indexPath.row).authorDisplayName
            cell.contentCommentLabel.text = viewModel?.getComment(at: indexPath.row).textDisplay
            if let url = viewModel?.getComment(at: indexPath.row).authorProfileImageUrl {
                cell.avatarImageView.setImageWith(urlString: url, index: indexPath.row)
            }
            return cell
        }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(with: UITableViewCell.self, indexPath: indexPath)
            cell.textLabel?.text = viewModel?.title
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        let cell = tableView.dequeueReusableCell(with: RatingTableViewCell.self, indexPath: indexPath)
        if let videoId = viewModel?.videoId, let rating = viewModel?.rating, let isPlayList = viewModel?.isPlayList {
            cell.viewModel = RatingCellViewModel(videoId: videoId,rating: rating, isPlayList: isPlayList)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let viewModel = viewModel, indexPath.row == viewModel.getCommentCount() - 4 && indexPath.section == 1 {
            viewModel.loadComment(loadMore: true, completed: { [weak self] (done, error) in
                guard let self = self else { return }
                if done {
                    self.tableView.reloadData()
                } else {
                    self.showErrorAlert(with: error)
                }
            })
        }
    }
}

extension DetailViewController: RatingCellDelegate {
    func ratingCell(_ cell: RatingTableViewCell, needPerform: RatingTableViewCell.Action, rating: String) {
        showHUB()
        viewModel?.ratingVideo(rating: rating, completion: { [weak self] (done, error) in
            guard let self = self else { return }
            if done {
                self.tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
            } else {
                self.showErrorAlert(with: error)
            }
            self.endHUB()
        })
    }
}
