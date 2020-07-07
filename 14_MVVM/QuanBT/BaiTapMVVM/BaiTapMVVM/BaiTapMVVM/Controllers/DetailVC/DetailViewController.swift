//
//  DetailViewController.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/10/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit
import MapKit

final class DetailViewController: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel = DetailViewModel()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Override
    override func setupUI() {
        super.setupUI()
        title = viewModel.titleDetail
        let nib = UINib(nibName: "DetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.dataSource = self
        setupScrollView()
        setupMapView()
        sliderImage()
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favoriteViewButton))
        if viewModel.favorite {
            rightButton.tintColor = .systemYellow
        } else {
            rightButton.tintColor = .black
        }
        navigationItem.rightBarButtonItem = rightButton
    }
    
    override func setupData() {
        super.setupData()
        viewModel.getDataDetail()
    }
    
    // MARK: - Function
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 300)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(imageView)
        }
    }
    
    @objc private func favoriteViewButton() {
        if viewModel.favorite {
            viewModel.favorite = false
        } else {
            viewModel.favorite = true
        }
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favoriteViewButton))
        if viewModel.favorite {
            rightButton.tintColor = .systemYellow
        } else {
            rightButton.tintColor = .black
        }
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func setupMapView() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963)
        annotation.title = "Danang"
        annotation.subtitle = "A city of Vietnam"
        detailMapView.addAnnotation(annotation)
        detailMapView.delegate = self
    }
    
    private func sliderImage() {
        for index in 0 ..< viewModel.images.count {
            UIView.animate(withDuration: 15, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(index) * self.view.frame.width, y: 0)
            })
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}

// MARK: - MKMapViewDelegate
extension DetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.animatesDrop = true
        pin.pinTintColor = .red
        return pin
    }
}
