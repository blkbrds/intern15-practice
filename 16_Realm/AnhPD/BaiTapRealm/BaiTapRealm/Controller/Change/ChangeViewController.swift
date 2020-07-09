//
//  ChangeViewController.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit
import RealmSwift

protocol ChangeViewControllerDelegate: class {
    func changeInfo(view: ChangeViewController, id: Int, title: String, subTitle: String)
}

class ChangeViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    
    weak var delegate: ChangeViewControllerDelegate?
    var viewModel: ChangeViewModel?
    var homeViewModel = HomeViewModel()
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        configNavigation()
        title = "Change"
        // Do any additional setup after loading the view.
    }
    
    private func configNavigation() {
        let delete = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-delete"), style: .plain, target: self, action: #selector(deleteTouchUpInSide))
        navigationItem.rightBarButtonItem = delete
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func deleteTouchUpInSide() {
        do {
            if let item = item {
                let realm = try Realm()
                
                try realm.write {
                    realm.delete(item)
                }
                navigationController?.popToRootViewController(animated: true)
            }
        } catch {
            print(error)
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        titleTextField.text = viewModel.title
        subTitleTextField.text = viewModel.subTitle
        idLabel.text = String(viewModel.id)
    }

    @IBAction func updateButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.changeInfo(view: self, id: Int(idLabel.text ?? "") ?? 0, title: titleTextField.text ?? "", subTitle: subTitleTextField.text ?? "")
        }
    }
}
