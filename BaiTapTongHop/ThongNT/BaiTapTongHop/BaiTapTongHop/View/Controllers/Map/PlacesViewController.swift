//
//  PlacesViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import GooglePlaces

final class PlacesViewController: ViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    // An array to hold the list of possible locations.
    var likelyPlaces: [GMSPlace] = []
    var selectedPlace: GMSPlace?
    let cellReuseIdentifier = "cell"

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        setupTableView()
    }

    // MARK: - Prepare
    // Pass the selected place to the new view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMain" {
            if let nextViewController = segue.destination as? MapViewController {
                nextViewController.selectedPlace = selectedPlace
            }
        }
    }
}

// MARK: - Setup UI Functions
extension PlacesViewController {
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}

// MARK: - UITableView Delegate
// Respond when a user selects a place.
extension PlacesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlace = likelyPlaces[indexPath.row]
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
}

// MARK: - UITableView Datasource
// Populate the table with the list of most likely places.
extension PlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(likelyPlaces)
        return likelyPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let collectionItem = likelyPlaces[indexPath.row]
        cell.textLabel?.text = collectionItem.name
        return cell
    }

    // Adjust cell height to only show the first five items in the table
    // (scrolling is disabled in IB).
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height / 5
    }

    // Make table rows display at proper height if there are less than 5 items.
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == tableView.numberOfSections - 1) {
            return 1
        }
        return 0
    }
}
