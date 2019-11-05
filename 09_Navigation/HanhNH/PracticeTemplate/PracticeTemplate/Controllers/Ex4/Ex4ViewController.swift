//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex4ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "goku3")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = searchButton
        let icon = UIBarButtonItem(image: UIImage(named: "icon"), style: .plain, target: self, action: #selector(iconImgae))
        navigationItem.rightBarButtonItem = icon
    }
    @objc func search() {

    }
    @objc func iconImgae() {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
    }

    override func setupData() {
    }


}
