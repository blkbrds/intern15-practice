//
//  MienVC.swift
//  BaiTap03
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class MienVC: BaseViewController {

    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleUpdateData), name: .didReceiveData, object: nil)
    }

    override func setupNavigationBar() {
        title = "Địa điểm"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEdit))
    }

    @objc private func handleUpdateData(_ notification: Notification) {
        let diaDiem = notification.object as? DiaDiem
        mienLabel.text = diaDiem?.mien
        tinhLabel.text = diaDiem?.tinh
        huyenLabel.text = diaDiem?.huyen
    }

    @objc private func handleEdit() {
        let diaDiemVC = DiaDiemVC()
        navigationController?.pushViewController(diaDiemVC, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
}
