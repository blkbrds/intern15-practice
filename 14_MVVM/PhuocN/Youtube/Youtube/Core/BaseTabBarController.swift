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
    
    private let homeVC = BaseNavigationController(rootViewController: HomeViewController())
    private let favoriteVC = BaseNavigationController(rootViewController: FavoriteViewController())
    
    enum ScreenTypes: Int {
        case homeVC = 0
        case favoriteVC
        
        var title: String {
            switch self {
            case .homeVC: return "Home"
            case .favoriteVC: return "Favorite"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .homeVC: return #imageLiteral(resourceName: "ic-home")
            case .favoriteVC: return nil
            }
        }
        
        var selectedImage: UIImage? {
            switch self {
            case .homeVC: return #imageLiteral(resourceName: "ic-home-selected")
            case .favoriteVC: return #imageLiteral(resourceName: "ic-map-selected")
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
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: ScreenTypes.favoriteVC.rawValue)
        setViewControllers([homeVC, favoriteVC], animated: true)
    }
}
