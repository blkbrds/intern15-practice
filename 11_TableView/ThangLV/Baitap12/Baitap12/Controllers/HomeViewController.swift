//
//  HomeViewController.swift
//  Baitap12
//
//  Created by PCI0008 on 1/14/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    
    @IBOutlet private weak var insertTextField: UITextField!
    @IBOutlet private weak var insertButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    private var numbers: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        insertButton.layer.cornerRadius = 15
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(tappedEditButton))
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    private func insertDataToTableView() {
        guard insertTextField.text != "" else { return }
        numbers.append(insertTextField.text!)
        let indexPath = IndexPath(row: numbers.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        view.endEditing(true)
    }
    
    @objc func tappedEditButton() {
        tableView.isEditing = !tableView.isEditing
        navigationItem.rightBarButtonItem?.title = "Done"
    }
    
    @IBAction private func touchUpInsideInsertButton(_ sender: Any) {
        insertDataToTableView()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = numbers[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        } 
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowToMove = numbers[sourceIndexPath.row]
        numbers.remove(at: sourceIndexPath.row)
        numbers.insert(rowToMove, at: destinationIndexPath.row)
    }
}
