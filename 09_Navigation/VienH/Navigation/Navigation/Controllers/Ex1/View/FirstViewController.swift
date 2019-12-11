//
//  FirstViewController.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View"
    }
    
    // MARK: config
    func setupUI() {

    }
    
    @IBAction private func pushToNextButton() {
        let vc = View1ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func changeBackgroundNavigation() {
        let image = UIImage(named: "Anh-Anime-1")
        navigationController?.navigationBar.setBackgroundImage(image?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),resizingMode: .stretch), for: .default)
    }
    
    @IBAction func changeTintcolorNavigation() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    @IBAction func addSearchBarNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "icons8-gear-50"
        searchController.searchBar.tintColor = .white
    }
    
    @IBAction func addGroupBarButtonNavigation() {
        let button1 = UIBarButtonItem(title: "A", style: .plain, target: self, action: nil)
        let button2 = UIBarButtonItem(title: "B", style: .plain, target: self, action: nil)
        let button3 = UIBarButtonItem(title: "C", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [button1, button2, button3]
    }
    
    @IBAction func changeBarButtonItemNavigation() {
        let button = UIBarButtonItem(image: UIImage(named: "ic_question"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = button
    }
}

