//
//  HomeViewController.swift
//  CustomView
//
//  Created by ANH NGUYỄN on 1/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var unFavoriteButton: UIButton!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var isHiddenView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomView()
        configButton(button: unFavoriteButton)
        configButton(button: favoriteButton)
    }

    private func addCustomView() {
        guard let customInforUser = Bundle.main.loadNibNamed("User", owner: self, options: nil)?.first as? User else { return }
        customInforUser.frame = isHiddenView.bounds
        customInforUser.delegate = self
        isHiddenView.addSubview(customInforUser)
    }

    @IBAction func FavoriteTouchUpInsdide(_ sender: Any) {
        self.isHiddenView.isHidden = false
    }
    
    @IBAction func unFavoriteTouchUpInside(_ sender: Any) {
        self.isHiddenView.isHidden = true
    }
    
    private func configButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
}

extension HomeViewController: UserDelegate {
    func customView(_ customview: User, needPerfom action: User.Action) {
        switch action {
        case .closeView:
            self.isHiddenView.isHidden = true
        }
    }
}
