//
//  ExerciseElevenViewController.swift
//  baitap11
//
//  Created by user on 12/24/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class ExerciseElevenViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

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
        messages = ["Hoàng Viên", "Tĩnh tâm sóng lặng từ nay\nVui buồn chợt tắt sống ngày an nhiên\nTrần gian mưa nắng ưu phiền\nThoát mê khai ngộ hương thiền toạ tâm\nGiọt sầu ngọt đắng thăng trầm\nDây oan ngưng kết tuệ tâm sáng ngời\nThong dong vui thoả đất trời\nNhư mây phiêu lãng rong chơi phương ngàn.", "Trích 1", "Sắc tài danh lợi vinh quang\nTâm không vướng bận an khang cuộc đời\nĐời người ngắn lắm ai ơi\nTham chi cho lắm khiến đời long đong", "Trích 2", "Cuộc đời tranh đấu bon chen\nMang chi gánh nặng thấp hèn thế gian."]
    }

    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UINib(nibName: "ExerciseElevenHomeCell", bundle: .main), forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.allowsMultipleSelection = true
        tableView.dataSource = self
    }

    private func configNavigationBar() {
        title = "Religion"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseElevenHomeCell
        cell.updateUI { () -> String in
            return messages[indexPath.row]
        }
        return cell
    }
}
