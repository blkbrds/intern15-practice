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

    var comments: [Comment] = []
    var albums: [String] = []
    var description: String = ""
    var lat: Double = 0.0
    var long: Double = 0.0

    func loadData() {
        self.comments = DetailViewModel.getDummyDatas()
        self.albums = DetailViewModel.getDummyImage()
        self.description = DetailViewModel.getDummyDescription()
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
            return albums.count
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

    func makeImageCellViewModel(at indexPath: IndexPath) -> ImageCellViewModel {
        return ImageCellViewModel(image: albums[indexPath.row])
    }

    func makeCommentViewModel(at indexPath: IndexPath) -> CommentViewModel {
        let item = comments[indexPath.row]
        return CommentViewModel(image: item.avatarImage,
            status: item.content,
            name: item.name,
            day: item.createds)
    }

    func makeMapViewModel(at indexPath: IndexPath) -> MapViewModel {
        return MapViewModel()
    }

    func makeDescription(at indexPath: IndexPath) -> DescriptionViewModel {
        return DescriptionViewModel(description: description)
    }

    func makeAlbumViewModel(at indexPath: IndexPath) -> AlbumImageViewModel {
        return AlbumImageViewModel(images: albums)
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

extension DetailViewModel {

    static func getDummyDatas() -> [Comment] {
        var users: [Comment] = []
        for i in 1...20 {
            switch i {
            case 1...3:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "orem Ipsum is simply dummy text of the printing and typesetting industry. ", created: Date())
                users.append(user)
            case 4...9:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "tham gia vào intern khoá 15 của công ty AseanTech, đang học và làm việc tại môi trường làm việc lớn.  ", created: Date())
                users.append(user)
            case 10...13:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", created: Date())
                users.append(user)
            default:
                let user = Comment(avatar: UIImage(named: "ic-image-hanh")!, name: "NGUYEN HONG HANH", status: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", created: Date())
                users.append(user)
            }
        }
        return users
    }

    static func getDummyImage() -> [String] {
        var images: [String] = []
        for i in 1...6 {
            images.append(String(i))
        }
        return images
    }
    
    static func getDummyDescription() -> String {
        return "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  asaasas  asasasaasaaaas sasasasasasasasdskjfksafjksjfsdjfdskfjdslkfjsdlkjvdsklvnx,mvnm,xcvncxmvnxzm,vnzxmvnxzm,nv,mxz"
    }
}
