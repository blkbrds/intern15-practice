//
//  DetailViewModel.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

final class DetailViewModel {

    let user: User
    
    init() {
        user = DummyData.userVinh
    }
}

extension DetailViewModel {

    func numberOfSection() -> Int {
        return SectionType.allCases.count
    }

    func numberOfItem(section: Int) -> Int {
        guard let section = SectionType(rawValue: section) else { return 0 }
        switch section {
        case .albums, .description, .map:
            return 1
        case .comments:
            return user.comments.count
        }
    }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        guard let section = SectionType(rawValue: indexPath.section) else { return CGFloat.zero }
        switch section {
        case .albums, .map:
            return 160
        case .comments, .description:
            return UITableView.automaticDimension

        }
    }

    func makeCommentViewModel(at indexPath: IndexPath) -> CommentViewModel {
        let item = user.comments[indexPath.row]
        return CommentViewModel(comment: item)
    }

    func makeMapViewModel(at indexPath: IndexPath) -> MapViewModel {
        return MapViewModel()
    }

    func makeDescription(at indexPath: IndexPath) -> DescriptionViewModel {
        return DescriptionViewModel(description: user.description)
    }

    func makeAlbumViewModel(at indexPath: IndexPath) -> AlbumImageViewModel {
        return AlbumImageViewModel(images: user.coverImages)
    }
}

extension DetailViewModel {

    enum SectionType: Int, CaseIterable {
        case albums
        case description
        case map
        case comments
    }
}
