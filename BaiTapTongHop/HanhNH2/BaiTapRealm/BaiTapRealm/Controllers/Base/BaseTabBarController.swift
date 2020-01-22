//
//  BaseTabBarController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    
    var viewModel = BaseTabBarViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }

    private func configTabBar() {
        let homeNavi = UINavigationController(rootViewController: HomeViewController())
        let mapNaVi = UINavigationController(rootViewController: MapViewController())
        let favoriteNaVi = UINavigationController(rootViewController: FavoriteViewController())
        let profileNaVi = UINavigationController(rootViewController: ProfileViewController())
        let viewControllers = [homeNavi, mapNaVi, favoriteNaVi, profileNaVi]
        for (index, vc) in viewControllers.enumerated() {
            let tabbarType = viewModel.getTabType(at: index)
            vc.tabBarItem = UITabBarItem(title: tabbarType.title,
                                         image: #imageLiteral(resourceName: tabbarType.imageName),
                                         tag: tabbarType.rawValue)
        }

        setViewControllers(viewControllers, animated: true)
        tabBar.tintColor = .black
    }
}
