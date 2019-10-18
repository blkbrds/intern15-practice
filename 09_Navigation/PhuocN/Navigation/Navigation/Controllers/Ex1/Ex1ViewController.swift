//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex1ViewController: BaseViewController {
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
    }
    
    @IBAction private func pushToNextView() {
        let vc = View1ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func changeBackgroundNavigation() {
        let image = UIImage(named: "ic-navigation")
        navigationController?.navigationBar.setBackgroundImage(image?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),resizingMode: .stretch), for: .default)
    }
    
    @IBAction private func changeTintcolorNavigation() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    @IBAction private func addSearchBarNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        // add search bar
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = .white
    }
    
    @IBAction private func changeBarButtonItemNavigation() {
        let button = UIBarButtonItem(image: UIImage(named: "ic_question"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = button
    }
    
    @IBAction private func addGroupBarButtonNavigation() {
        let button1 = UIBarButtonItem(title: "A", style: .plain, target: self, action: nil)
        let button2 = UIBarButtonItem(title: "B", style: .plain, target: self, action: nil)
        let button3 = UIBarButtonItem(title: "C", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [button1, button2, button3]
    }
}
