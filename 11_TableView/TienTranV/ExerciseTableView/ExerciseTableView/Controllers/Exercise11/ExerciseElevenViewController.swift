//
//  ExerciseElevenViewController.swift
//  ExerciseTableView
//
//  Created by TranVanTien on 12/8/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseElevenViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!

    // MARK: - Properties
    private var messages: [String] = []

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configTableView()
        configNavigationBar()
    }

    override func setupData() {
        super.setupData()
        messages = ["Trần Văn Tiến", "Bước tới đèo Ngang bóng xế tà\nCỏ cây chen đá, lá chen hoa\nLom khom dưới núi, tiều vài chú\nLác đác bên sông, chợ mấy nhà\nNhớ nước đau lòng con quốc quốc\nThương nhà mỏi miệng cái gia gia\nDừng chân đứng lại: trời, non, nước\nMột mảnh tình riêng, ta với ta.", "AAA", "Bước tới đèo Ngang bóng xế tà\nCỏ cây chen đá, lá chen hoa\nLom khom dưới núi, tiều vài chú\nLác đác bên sông, chợ mấy nhà", "CCC", "Bước tới đèo Ngang bóng xế tà\nCỏ cây chen đá, lá chen hoa\nLom khom dưới núi, tiều vài chú\nLác đác bên sông, chợ mấy nhà\nNhớ nước đau lòng con quốc quốc\nThương nhà mỏi miệng cái gia gia", "Thương nhà mỏi miệng cái gia gia", "ABC"]
    }

    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UINib(nibName: "ExerciseElevenCell", bundle: .main), forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.allowsMultipleSelection = true
        tableView.dataSource = self    }

    private func configNavigationBar() {
        title = "Reorder"
        turnOffEditingMode()
    }

    @objc private func turnOffEditingMode() {
        tableView?.isEditing = false
        let editButtonBarItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItem = editButtonBarItem
    }

    @objc private func turnOnEditingMode() {
        tableView?.isEditing = true
        let doneButtonBarItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButtonBarItem
    }
}

//MARK: - Extension: UITableViewDataSource
extension ExerciseElevenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseElevenCell
        cell.updateUI { () -> String in
            return messages[indexPath.row]
        }
        return cell
    }
}
