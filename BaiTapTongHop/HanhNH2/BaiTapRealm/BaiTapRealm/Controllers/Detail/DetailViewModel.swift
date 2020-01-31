//
//  DetailViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
final class DetailViewModel {
    
    var repo: Repository?
    
    func makeCommentViewModel(at indexPath: IndexPath) -> DetailCellViewModel? {
        return DetailCellViewModel(repo: repo!)
    }
}
