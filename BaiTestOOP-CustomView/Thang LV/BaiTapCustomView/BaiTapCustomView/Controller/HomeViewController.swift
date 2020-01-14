//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0008 on 1/13/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var unFavoriteButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?[0] as? CustomView
        customView?.frame = CGRect(x: 10, y: 100, width: view.frame.width - 20, height: view.frame.height / 2)
        customView?.avatarImageView.layer.masksToBounds = true
        customView?.avatarImageView.layer.cornerRadius = (customView?.avatarImageView.frame.height)! / 2
        customView?.privateLabel.layer.cornerRadius = 3
        customView?.privateLabel.layer.masksToBounds = true
        customView?.doctorLabel.layer.cornerRadius = 3
        customView?.doctorLabel.layer.masksToBounds = true
        customView?.engineerLabel.layer.cornerRadius = 3
        customView?.engineerLabel.layer.masksToBounds = true
        unFavoriteButton.layer.cornerRadius = 22
        unFavoriteButton.layer.masksToBounds = true
        favoriteButton.layer.cornerRadius = 22
        favoriteButton.layer.masksToBounds = true
        guard let view = customView else { return }
        view.delegate = self
        self.view.addSubview(view)
    }
}

extension HomeViewController: CustomViewDelegate {
    func view(view: CustomView, needPerform action: CustomView.Action) {
        switch action {
        case .closeThisCustomView:
            view.isHidden = true
        }
    }
}
