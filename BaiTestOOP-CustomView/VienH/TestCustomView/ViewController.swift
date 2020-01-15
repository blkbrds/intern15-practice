//
//  ViewController.swift
//  TestCustomView
//
//  Created by user on 1/15/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var unFavoriteButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    private var userView: UserView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Introduction"
        view.backgroundColor = .black
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

        userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView
        guard let userView = userView else {
            return
        }

        let widthView = view.bounds.width - 20
        let heightView = 555
        let xView = view.bounds.width / 2 - widthView / 2
        let yView = view.bounds.height / 2 - CGFloat(heightView) / 2
        userView.frame = CGRect(x: xView, y: yView, width: widthView, height: CGFloat(heightView))
        userView.delegate = self
        userView.setupLayout()
        view.addSubview(userView)
    }
}

extension ViewController: UserViewDelegate {
    func closeUserView(for view: UserView) {
        UIView.animate(withDuration: 0.3) {
            self.userView.frame.origin.x -= self.view.bounds.width
        }
    }
}
