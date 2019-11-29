//
//  HomeViewController.swift
//  BaiTap04
//
//  Created by PCI0002 on 11/29/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    var navBar: UINavigationBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func setupUI() {
        title = "Home"
        navBar = navigationController?.navigationBar
    }
    
    lazy var searchBar = UISearchBar()

    @IBAction private func changeNavigationBarToucUpInside(_ sender: UIButton) {
        clearNavigationBar()
        switch sender.tag {
        case 1:
            title = "Gradient NavigationBar"
            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.backgroundColor = UIColor(displayP3Red: 231 / 255, green: 28 / 255, blue: 89 / 255, alpha: 1)
        case 2:
            title = "News Feed"
            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navBar?.backgroundColor = .blue
            navBar?.tintColor = .blue
            let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
            let rigthBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "profile"), style: .plain, target: nil, action: nil)
            navigationItem.rightBarButtonItem = rigthBarButtonItem
            navigationItem.leftBarButtonItem = leftBarButtonItem
        case 3:
            searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
            searchBar.placeholder = "Search"
            searchBar.delegate = self
            let leftSearchBarButotItem = UIBarButtonItem(customView: searchBar)
            navigationItem.leftBarButtonItems = [leftSearchBarButotItem]
        default:
            return
        }
    }

    private func clearNavigationBar() {
        title = ""
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItems = []
        navigationItem.leftBarButtonItems = []
        navBar?.backgroundColor = .white
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}
