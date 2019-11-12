//
//  RatingTableViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 11/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol RatingCellDelegate: class {
    func ratingCell(_ cell: RatingTableViewCell, needPerform: RatingTableViewCell.Action, rating: String)
    func ratingCell(_ cell: RatingTableViewCell, needPerform: RatingTableViewCell.Action)
}

final class RatingTableViewCell: UITableViewCell {
    //MARK: -IBOulet
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var disLikeButton: UIButton!
    @IBOutlet private weak var addPlayListButton: UIButton!
    
    //MARK: -Properties
    enum Action {
        case like
        case disLike
        case addPlayList
        case addComment
    }
    
    var viewModel: RatingCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    weak var delegate: RatingCellDelegate?
    
    //MARK: -config
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        if viewModel.isPlayList {
            addPlayListButton.tintColor = App.Color.mainColor
        } else {
            addPlayListButton.tintColor = .darkGray
        }
        switch viewModel.rating {
        case (true, false):
            likeButton.setImage(UIImage(named: "ic-like-selected"), for: .normal)
            disLikeButton.setImage(UIImage(named: "ic-dislike"), for: .normal)
        case (false, true):
            likeButton.setImage(UIImage(named: "ic-like"), for: .normal)
            disLikeButton.setImage(UIImage(named: "ic-dislike-selected"), for: .normal)
        case (false, false):
            likeButton.setImage(UIImage(named: "ic-like"), for: .normal)
            disLikeButton.setImage(UIImage(named: "ic-dislike"), for: .normal)
        default:
            break
        }
    }
    
    //MARK: -IBACtion
    @IBAction private func addPlayListTouchUpInside(_ sender: Any) {
        viewModel?.changePlayList(completion: { done, error in
            if !done {
                print(error)
            } else {
                print("Done save")
            }
        })
    }
    
    @IBAction private func disLikeButtonTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        if !viewModel.rating.disLike {
            delegate?.ratingCell(self, needPerform: .like, rating: "dislike")
        } else {
            delegate?.ratingCell(self, needPerform: .like, rating: "none")
        }
    }
    
    @IBAction private func likeButtonTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        if !viewModel.rating.like {
            delegate?.ratingCell(self, needPerform: .like, rating: "like")
        } else {
            delegate?.ratingCell(self, needPerform: .like, rating: "none")
        }
    }
    
    @IBAction private func addComment(_ sender: Any) {
        delegate?.ratingCell(self, needPerform: .addComment)
    }
}
