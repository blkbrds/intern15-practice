//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

protocol Ex3ViewControllerDataSource: class {
    func getLocation() -> (mien: String?, tinh: String?, huyen: String?)
//    func getMienTinh() -> (String?,String?)
}

class Ex3ViewController: BaseViewController {
    
    weak var dataSource: Ex3ViewControllerDataSource?
    
    @IBOutlet private weak var huyenLabel: UILabel!
    @IBOutlet private weak var tinhLabel: UILabel!
    @IBOutlet private weak var mienLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let mien = dataSource?.getLocation().mien,
            let tinh = dataSource?.getLocation().tinh,
            let huyen = dataSource?.getLocation().huyen else { return }
        huyenLabel.text = huyen
        mienLabel.text = mien
        tinhLabel.text = tinh
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Dia diem"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pushToNextViewController))
    }
    
    override func setupData() {
    }
    
    @objc func pushToNextViewController() {
        let vc = MienViewController()
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension Ex3ViewController: MienViewControllerDataSource {
    func getMienSelected() -> (mien: String?, tinh: String?, huyen: String?) {
        return (mienLabel.text, tinhLabel.text, huyenLabel.text)
    }
    
    
}
