//
//  SectionsViewController.swift
//  TableView
//
//  Created by PCI0018 on 11/12/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class SectionsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var users: [String] = []
    private var animal: [String] = []
    private var plants: [String] = []
    private var generalIndex: [String] = []
    private var general = [String: [String]]()
    private var nameSelected: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sections"
        configTableView()
        setupData()
    }

    //MARK: - Private function
    private func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cells")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupData() {
        users = ContactDatamagement.share.getData()
        ContactDatamagement.share.setFilePlist(name: "Animals")
        animal = ContactDatamagement.share.getData()
        ContactDatamagement.share.setFilePlist(name: "Plants")
        plants = ContactDatamagement.share.getData()
        general = ["users": users, "animal": animal, "plants": plants]
        generalIndex = ["U", "A", "P"].sorted()
    }
}

extension SectionsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return general.keys.sorted()[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return general.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = general[general.keys.sorted()[section]] else { return 0 }
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as? CustomTableViewCell,
            let name = general[general.keys.sorted()[indexPath.section]]?[indexPath.row] else {
                return UITableViewCell()
        }
        cell.delegate = self
        cell.updateTableCell(name: name, subTitle: "Click me", imageName: "avatar_img")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let name = general[general.keys.sorted()[indexPath.section]]?[indexPath.row] else { return }
        nameSelected = name
        let detailViewController = DetailViewController()
        detailViewController.dataSource = self
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return generalIndex
    }
}

extension SectionsViewController: DetailViewControllerDataSource {
    func getName() -> String? {
        return nameSelected
    }
}

extension SectionsViewController: CustomTableViewCellDelegate {
    func cell(cell: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action) {
        switch action {
        case .userTap(let name):
            let alert = UIAlertController(title: "TAP", message: "Bạn đã nhấp vào \(name)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
}
