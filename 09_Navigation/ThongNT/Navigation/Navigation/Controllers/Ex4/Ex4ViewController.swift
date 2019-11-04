//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: config
    override func setupUI() {
        super.setupUI()
    }

    @IBAction func clickToGoVC(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            clearAll()
            backgroundNavi()
        case 1:
            clearAll()
            searchBarInNavi()
        case 2:
            clearAll()
            gradientNaviBar()
        case 3:
            clearAll()
            naviBarItem()
        case 4:
            clearAll()
            naviBarItems()
        case 5:
            clearAll()
        default:
            break
        }
    }

    private func backgroundNavi() {
        let image = UIImage(named: "Avatar_img")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }

    private func searchBarInNavi() {
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        searchBar.placeholder = "Search"
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(anyWayAction))
        navigationItem.rightBarButtonItem = cancelButton
    }

    private func gradientNaviBar() {
        let gradientLayer = CAGradientLayer()
        let flareRed = UIColor(displayP3Red: 241.0 / 255.0, green: 39.0 / 255.0, blue: 17.0 / 255.0, alpha: 1.0)
        let flareOrange = UIColor(displayP3Red: 245.0 / 255.0, green: 175.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
        var updatedFrame = self.navigationController!.navigationBar.bounds
        updatedFrame.size.height += 20
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [flareRed.cgColor, flareOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // vertical gradient start
        gradientLayer.endPoint = CGPoint(x: 1, y: 0) // vertical gradient end
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

    private func naviBarItem () {
        let heartButton = UIBarButtonItem(image: UIImage(named: "icon_heart_img"), style: .plain, target: self, action: #selector(like))
        navigationItem.rightBarButtonItem = heartButton
    }

    @objc func like() {
        let alert = UIAlertController(title: "THÔNG BÁO", message: "Click để làm gì???", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    private func naviBarItems() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(anyWayAction))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(anyWayAction))
        navigationItem.rightBarButtonItems = [searchButton, doneButton]

        let pauseButton = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(anyWayAction))
        let playButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(anyWayAction))
        navigationItem.leftBarButtonItems = [pauseButton, playButton]
    }

    @objc func anyWayAction() {}

    private func clearAll() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.leftBarButtonItems = nil
        navigationItem.rightBarButtonItems = nil
    }
    
    override func setupData() {
    }
}
