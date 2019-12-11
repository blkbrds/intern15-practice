//
//  GardentViewController.swift
//  ExerciseTableView
//
//  Created by TranVanTien on 12/7/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class GardentViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var animals: [Animal] = []
    private var vegetables: [Vegetable] = []
    private var flowers: [Flower] = []
    private var gardens: [[Gardent]] = []
    private var gardenIndexs: [String] = []
    private var gardenTitleForHeader: [String] = []
    private let cell = "gardentCell"

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        title = "My Gardent"
        configTableView()
    }

    override func setupData() {
        super.setupData()
        if let animalsString = DataManagement.shared().getDataFromFile(fileName: "Animals", type: "plist"),
            let vegetablesString = DataManagement.shared().getDataFromFile(fileName: "Vegetables", type: "plist"),
            let flowersString = DataManagement.shared().getDataFromFile(fileName: "Flowers", type: "plist") {

            animalsString.forEach { (animalStr) in
                let animal = Animal(imageName: "animal", title: animalStr, subTitle: "xem thêm chi tiết vật nuôi...")
                animals.append(animal)
            }

            vegetablesString.forEach { (vegetableStr) in
                let vegetable = Vegetable(imageName: "vegetable", title: vegetableStr, subTitle: "xem thêm chi tiết trái cây...")
                vegetables.append(vegetable)
            }

            flowersString.forEach { (flowerStr) in
                let flower = Flower(imageName: "hoahong", title: flowerStr, subTitle: "xem thêm chi tiết loài hoa...")
                flowers.append(flower)
            }
        }

        gardens.append(flowers)
        gardens.append(animals)
        gardens.append(vegetables)
        gardenIndexs = ["F", "A", "V"]
        gardenTitleForHeader = ["Flowers", "Animals", "Vegetables"]
    }

    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UINib(nibName: "GardentCell", bundle: .main), forCellReuseIdentifier: cell)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Extention: UITableViewDataSource
extension GardentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gardens[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gardentCell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! GardentCell
        gardentCell.updateUI(garden: { () -> Gardent in
            return self.gardens[indexPath.section][indexPath.row]
        })
        gardentCell.delegate = self
        return gardentCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return gardens.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return gardenTitleForHeader[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndexs
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

// MARK: - Extention: UITableViewDelegate
extension GardentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - Extention: GardentCellDelegate
extension GardentViewController: GardentCellDelegate {
    func cell(customCell: GardentCell, needPerformAction action: GardentCell.Action) {
        switch action {
        case .sendTitle(let title):
            let alert = UIAlertController(title: "TAP ME", message: "Bạn đã click vào \(title)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
}
