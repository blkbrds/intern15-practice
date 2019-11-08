//
//  BaseTabBarController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    static weak var shared: BaseTabBarController?
    
    let homeVC = BaseNavigationController(rootViewController: HomeViewController())
    let favoriteVC = BaseNavigationController(rootViewController: FavoriteViewController())
    let mapVC = BaseNavigationController(rootViewController: MapViewController())
    let profileVC = BaseNavigationController(rootViewController: ProfileViewController())
    
    enum ScreenTypes: Int {
        case homeVC = 0
        case favoriteVC
        case mapVC
        case profileVC
        
        var title: String {
            switch self {
            case .homeVC: return "Home"
            case .favoriteVC: return "Favorite"
            case .mapVC: return "Map"
            case .profileVC: return "Profile"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .homeVC: return #imageLiteral(resourceName: "ic-home")
            case .favoriteVC: return nil
            case .mapVC: return #imageLiteral(resourceName: "ic-map-selected")
            case .profileVC: return nil
            }
        }
        
        var selectedImage: UIImage? {
            switch self {
            case .homeVC: return #imageLiteral(resourceName: "ic-home-selected")
            case .favoriteVC: return #imageLiteral(resourceName: "ic-map-selected")
            case .mapVC: return nil
            case .profileVC: return nil
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        configViewControllers()
        configUI()
    }
    
    //MARK: -config
    private func config() {
        BaseTabBarController.shared = self
    }
    
    private func configUI() {
        tabBar.tintColor = App.Color.mainColor
        tabBar.barTintColor = App.Color.backgroudColor
    }
    
    private func configViewControllers() {
        homeVC.tabBarItem = UITabBarItem(title: ScreenTypes.homeVC.title, image: ScreenTypes.homeVC.image, selectedImage: ScreenTypes.homeVC.selectedImage)
        mapVC.tabBarItem = UITabBarItem(title: ScreenTypes.mapVC.title, image: ScreenTypes.mapVC.image, selectedImage: ScreenTypes.mapVC.selectedImage)
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: ScreenTypes.favoriteVC.rawValue)
        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: ScreenTypes.profileVC.rawValue)
        setViewControllers([homeVC, mapVC, favoriteVC, profileVC], animated: true)
    }
}
