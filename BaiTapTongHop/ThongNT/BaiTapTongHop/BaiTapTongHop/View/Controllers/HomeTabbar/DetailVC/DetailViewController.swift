//
//  DetailViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import MapKit

final class DetailViewController: ViewController {

    //MARK: - IBOulet
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var tableView: UITableView!

    //MARK: - Private Properties
    private let cellIdentifier: String = "DetailTableViewCell"
    private let myLocation = CLLocation(latitude: 16.059142, longitude: 108.201540)
    private let regionRadius: CLLocationDistance = 1000

    var viewModel = DetailViewModel()

    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        centerMapOnLocation(location: myLocation)
    }

    override func setupUI() {
        super.setupUI()
        title = "Detail"
        configTableView()
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }

    //MARK: - Private Functions
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    private func configTableView() {
        tableView.register(UINib(nibName: cellIdentifier, bundle: .main), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Extention TableView
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
