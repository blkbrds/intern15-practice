//
//  ViewController.swift
//  Custom View Test
//
//  Created by An Nguyễn on 1/13/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var unFavoriteButton: UIButton!
    private var userView: UserView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Introduction"
        view.backgroundColor = .lightGray
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }

    func setupUI() {
        favoriteButton.layer.cornerRadius = favoriteButton.bounds.height / 2
        unFavoriteButton.layer.borderColor = UIColor.white.cgColor
        unFavoriteButton.layer.borderWidth = 1
        unFavoriteButton.layer.cornerRadius = unFavoriteButton.bounds.height / 2

        //Load nib
        userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView
        guard let userView = userView else {
            return
        }
        
        let widthView = view.bounds.width - 40
        let heightView = 350
        let xView = view.bounds.width / 2 - widthView / 2
        let yView = view.bounds.height / 2 - CGFloat(heightView) / 2
        userView.frame = CGRect(x: xView, y: yView, width: widthView, height: CGFloat(heightView))
        userView.delegate = self
        userView.setupLayout()
        view.addSubview(userView)
    }

    @IBAction func unFavoriteButton(_ sender: Any) {
    }

    @IBAction func faavoriteButton(_ sender: Any) {
    }
}

extension ViewController: UserViewDelegate {
    func closeUserView(for view: UserView) {
        UIView.animate(withDuration: 0.3) {
            self.userView.frame.origin.x -= self.view.bounds.width
        }
    }
}
