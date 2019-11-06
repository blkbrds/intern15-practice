//
//  DetailViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var videoImageView: UIImageView!
    
    var notificationToken: NotificationToken?
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        updateUI()
        changeValueFromRealm()
    }
    
    func changeValueFromRealm() {
        let result = RealmManager.shared.realm.objects(Video.self)
        notificationToken = result.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            switch changes {
            case .initial:
                break
            case .update(let videos, _, _, let modifier):
                for index in modifier {
                    print(videos, modifier)
                    if videos[index].id == self.viewModel?.videoId {
                        self.viewModel?.changeLike()
                        self.updateUI()
                    }
                }
                self.updateUI()
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    
    override func loadData() {
        guard let viewModel = viewModel else { return }
        viewModel.loadData(loadMore: false) { [weak self] (done, error) in
            guard let self = self else { return }
            if done {
                self.tableView.reloadData()
            } else {
                print("Fail")
            }
        }
    }
    
    override func setupUI() {
        tableView.register(withNib: CommentTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func updateUI() {
        guard let viewModel = viewModel else { return }
        channelLabel.text = viewModel.channel
        titleLabel.text = viewModel.title
        videoImageView.image = viewModel.imageVideo
        if viewModel.isLike {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-like-selected"), style: .done, target: self, action: #selector(likeBarButton))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-like"), style: .plain, target: self, action: #selector(likeBarButton))
        }
    }
    
    @objc private func likeBarButton() {
        viewModel?.likeVideo(completion: { (done) in
            if done {
                //self.updateUI()
            } else {
                // show Alert
            }
        })
    }
    
//    deinit {
//        self.notificationToken?.invalidate()
//    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comment"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.comment.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CommentTableViewCell.self, indexPath: indexPath)
        cell.nameAuthLabel.text = viewModel?.getComment(at: indexPath.row).authorDisplayName
        cell.contentCommentLabel.text = viewModel?.getComment(at: indexPath.row).textDisplay
        if let url = viewModel?.getComment(at: indexPath.row).authorProfileImageUrl {
            cell.avatarImageView.setImageWith(urlString: url, index: indexPath.row)
        }
        return cell
    }
}
