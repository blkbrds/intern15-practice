//
//  DetailCategoryViewController.swift
//  SwiftRealm
//
//  Created by PCI0002 on 5/13/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//


import UIKit

final class DetailCategoryViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var category: Category?
    var viewModel: AddEditCategoryViewModel? {
        didSet {

        }
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    override func setUpUI() {
        title = "Detail Category"
        let nib = UINib(nibName: "PostTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = AddEditCategoryViewController()
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func customNavi() {

    }

    // MARK: - Private Functions
    private func configUI() {
        guard let viewModel = viewModel else {
            return
        }
        category = viewModel.category
        guard let category = category else {
            return
        }
        print(category)
        print(category.title)
        titleLabel.text = category.title
        typeLabel.text = category.type
        dateLabel.text = category.date
        countLabel.text = "Count: \(category.count)"
    }

    // MARK: - Actions
    @IBAction private func addButtonTouchUpInside(_ sender: UIButton) {

    }
}

// MARK: -
extension DetailCategoryViewController {

}
