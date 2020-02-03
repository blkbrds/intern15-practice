//
//  ViewController.swift
//  TestCustomView
//
//  Created by PCI0002 on 1/13/20.
//  Copyright © 2020 TranVanTien. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var unFavoriteButton: UIButton!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var inforView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomView()
        title = "Introduction"
        configButton(button: unFavoriteButton)
        configButton(button: favoriteButton)
    }

    private func addCustomView() {
        guard let customInforUser = Bundle.main.loadNibNamed("InforUser", owner: self, options: nil)?.first as? InforUser else { return }
        customInforUser.frame = inforView.bounds
        customInforUser.delegate = self
        inforView.clipsToBounds = true
        inforView.layer.cornerRadius = 10
        inforView.addSubview(customInforUser)
    }

    private func configButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
}

extension ViewController: InforUserDelegate {
    func customView(_ customview: InforUser, needPerfom action: InforUser.Action) {
        switch action {
        case .closeView:
            self.inforView.isHidden = true
        }
    }
}
