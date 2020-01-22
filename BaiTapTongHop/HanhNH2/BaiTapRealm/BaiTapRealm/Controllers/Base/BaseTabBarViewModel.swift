//
//  BaseTabBarViewModel.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation

final class BaseTabBarViewModel {
    
    enum TabbarType: Int, CaseIterable {
        case home
        case map
        case favorite
        case profile
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .map:
                return "Map"
            case .favorite:
                return "Favorite"
            case .profile:
                return "Profile"
            }
        }

        var imageName: String {
            switch self {
            case .home:
                return "ic-tabbar-home"
            case .map:
                return "ic-tabbar-map"
            case .favorite:
                return "ic-tabbar-favorites"
            case .profile:
                return "ic-tabbar-profile"
            }
        }
    }

    func getTabType(at index: Int) -> TabbarType {
        return TabbarType.allCases[index]
    }
}
