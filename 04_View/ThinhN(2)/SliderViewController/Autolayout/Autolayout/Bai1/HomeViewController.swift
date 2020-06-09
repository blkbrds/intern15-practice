//
//  HomeViewController.swift
//  Autolayout
//
//  Created by PCI0019 on 6/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var popUpView: PopUpView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView = Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)? [0] as? PopUpView
    }
    
    @IBAction func showButtonTouchUpInsine(_ sender: Any) {
       guard let popUpView = popUpView else {return}
       popUpView.frame = CGRect(x: 100, y: 200, width: UIScreen.main.bounds.width / 2, height: 400)
       view.addSubview(popUpView)
        popUpView.delegate = self
        popUpView.removeFromSuperview()
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
