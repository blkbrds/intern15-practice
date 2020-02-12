//
//  GardenViewController.swift
//  baitp09+09plus
//
//  Created by user on 12/23/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class GardenViewController: BaseViewController {

    //MARK - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var animals: [Animal] = []
    private var vegetables: [Vegetable] = []
    private var flowers: [Flower] = []
    private var gardents: [[Gardent]] = []
    private var gardentIndexs: [String] = []
    private var gardentTitleForHeader: [String] = []
    private let gardentsCell = "GardentCell"

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        title = Config.titleGardenViewController
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
                let flower = Flower(imageName: "flower", title: flowerStr, subTitle: "xem thêm chi tiết loài hoa...")
                flowers.append(flower)
            }
        }
        gardents.append(flowers)
        gardents.append(animals)
        gardents.append(vegetables)
        gardentIndexs = ["F", "A", "V"]
        gardentTitleForHeader = ["Flowers", "Animals", "Vegetables"]
    }

    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UINib(nibName: gardentsCell, bundle: .main), forCellReuseIdentifier: gardentsCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Extention: UITableViewDataSource
extension GardenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gardents[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gardentCell = tableView.dequeueReusableCell(withIdentifier: gardentsCell, for: indexPath) as! GardentCell
        gardentCell.updateUI(garden: { () -> Gardent in
            return self.gardents[indexPath.section][indexPath.row]
        })
        gardentCell.delegate = self
        return gardentCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return gardents.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return gardentTitleForHeader[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardentIndexs
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

// MARK: - Extention: UITableViewDelegate
extension GardenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Config.heightForRow
    }
}

// MARK: - Extention: GardentCellDelegate
extension GardenViewController: GardentCellDelegate {
    func cell(cell: GardentCell, needPerformAction action: GardentCell.Action) {
        switch action {
        case .send(let title):
            let alert = UIAlertController(title: "SHOW", message: "Bạn đã click vào \(title)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
}

extension GardenViewController {
    struct Config {
        static let heightForRow: CGFloat = 100
        static let clipsToBoundsImage = true
        static let cornerRadiusImage: CGFloat = 40
        static let borderWidthImage: CGFloat = 1
        static let borderColorImage = UIColor.orange.cgColor
        static let titleGardenViewController = "My Gardent"
    }
}
