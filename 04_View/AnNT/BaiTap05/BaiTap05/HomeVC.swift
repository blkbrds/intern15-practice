//
//  HomeVC.swift
//  BaiTap05
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

final class HomeVC: UIViewController {

    private var sliderCustom: SliderCustom!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        sliderCustom.delegate = self
    }

    func setupUI() {
        view.backgroundColor = .white
        sliderCustom = SliderCustom(frame: CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 25, width: 50, height: 400))
        view.addSubview(sliderCustom)
    }
}

extension HomeVC: SliderCustomDelegate {
    func customView(customView: SliderCustom, needPerformAction action: SliderCustom.Action) {
        switch action {
            case .valueChanged(let value):
                print(value)
        }
    }
}
