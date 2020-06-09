//
//  HomeViewController.swift
//  Autolayout
//
//  Created by PCI0019 on 6/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var showButtonTouchUpInsine: UIButton!
    
    let popUpView = Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)? [0] as? PopUpView
    override func viewDidLoad() {
        popUpView?.setupView()
        super.viewDidLoad()
    }
    
    @IBAction func push(_ sender: Any) {
        guard let popUpView = popUpView else {return}
        popUpView.frame = CGRect(x: 80, y: 200, width: UIScreen.main.bounds.width / 1.5 , height: 400)
        popUpView.delegate = self
        popUpView.isHidden = false
        view.addSubview(popUpView)
    }
}
extension HomeViewController: PopUpDelegate {
    func passData(view: PopUpView) {
        view.isHidden = true
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true )
    }
}
