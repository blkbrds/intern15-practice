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
    
    //MARK: -IBOutlet
    @IBOutlet private weak var commentTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var webKit: WKWebView!
    @IBOutlet private weak var maskView: UIView!
    
    //MARK: -Properties
    enum Action {
        case loadData
        case rating
        case addPlayList
        case addComment
        case loadMore
        case loadVideoPlayer
    }
    
    private var notificationToken: NotificationToken?
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        changeValueFromRealm()
        playVideo()
    }
    
    //MARK: -Config
    override func setupUI() {
        // comment text
        commentTextField.isHidden = true
        commentTextField.delegate = self
        // maskview
        maskView.isHidden = true
        // tableview
        tableView.register(withNib: CommentTableViewCell.self)
        tableView.register(withNib: RatingTableViewCell.self)
        tableView.register(with: UITableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func loadData() {
        guard let viewModel = viewModel else { return }
        viewModel.loadComment(loadMore: false) { [weak self] (done, error) in
            guard let self = self else { return }
            if done {
                self.updateUI(action: .loadData)
            }
        }
        viewModel.checkRating { (done, error) in
            if done {
                self.updateUI(action: .rating)
            }
        }
    }
    
    private func updateUI(action: Action, request: URLRequest? = nil) {
        switch action {
        case .addComment:
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
        case .loadData, .loadMore:
            tableView.reloadData()
        case .addPlayList, .rating:
            tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
        case .loadVideoPlayer:
            if let request = request {
                webKit.load(request)
            }
        }
    }
    
    //MARK: -Private func
    private func changeValueFromRealm() {
        let result = RealmManager.shared.realm.objects(PlayList.self)
        notificationToken = result.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            switch changes {
            case .initial:
                break
            case .update(_, _, _, _):
                self.updateUI(action: .addPlayList)
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    private func playVideo() {
        guard let viewModel = viewModel else { return }
        viewModel.playVideo(completion: { [weak self] (done, error, request) in
            guard let self = self else { return }
            if done {
                self.updateUI(action: .loadVideoPlayer, request: request)
            } else {
                self.showErrorAlert(with: "Can not load this video")
            }
        })
    }
    
    private func showHUB() {
        maskView.isHidden = false
    }
    
    private func endHUB() {
        maskView.isHidden = true
    }
}

//MARK: -tableviewdatasource, delegate
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
            cell.textLabel?.text = viewModel?.video.title
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        let cell = tableView.dequeueReusableCell(with: RatingTableViewCell.self, indexPath: indexPath)
        if let video = viewModel?.video, let rating = viewModel?.rating, let isPlayList = viewModel?.isPlayList {
            cell.viewModel = RatingCellViewModel(video: video,rating: rating, isPlayList: isPlayList)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let viewModel = viewModel, indexPath.row == viewModel.getCommentCount() - 4 && indexPath.section == 1 {
            viewModel.loadComment(loadMore: true, completed: { [weak self] (done, error) in
                guard let self = self else { return }
                if done {
                    self.updateUI(action: .loadMore)
                } else {
                    self.showErrorAlert(with: error)
                }
            })
        }
    }
}

//MARK: -RatingCelldelegate
extension DetailViewController: RatingCellDelegate {
    
    func ratingCell(_ cell: RatingTableViewCell, needPerform: RatingTableViewCell.Action) {
        if needPerform == .addComment {
            commentTextField.isHidden = !commentTextField.isHidden
        }
    }
    
    func ratingCell(_ cell: RatingTableViewCell, needPerform: RatingTableViewCell.Action, rating: String) {
        showHUB()
        viewModel?.ratingVideo(rating: rating, completion: { [weak self] (done, error) in
            guard let self = self else { return }
            if done {
                self.updateUI(action: .rating)
            } else {
                self.showErrorAlert(with: error)
            }
            self.endHUB()
        })
    }
}

// MARK: -TextField Delegate
extension DetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard !textField.isHidden, let comment = textField.text, !comment.isEmpty else { return true }
        viewModel?.addComment(mess: comment, completion: { [weak self] (done, error) in
            guard let self = self else { return }
            if !done {
                self.showErrorAlert(with: error)
            } else {
                self.updateUI(action: .addComment)
            }
        })
        textField.isHidden = true
        textField.resignFirstResponder()
        return true
    }
}
