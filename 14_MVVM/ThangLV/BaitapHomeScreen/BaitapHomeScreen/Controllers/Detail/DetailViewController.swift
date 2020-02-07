//
//  DetailViewController.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/4/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var detailViewModel = DetailViewModel() {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        configMainScrollView()
        configTableView()
        configMapView()
        setupScrollView()
        slideTheImages()
    }
    
    private func configTableView() {
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        tableView.dataSource = self
        //tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.reloadData()
    }
    
    // MARK: - Private Functions
    private func configMainScrollView() {
        mainScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
    }
    
    // update view
    private func updateView() { }
    
    private func configMapView() {
        addAnnotation()
    }
    
    private func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963)
        annotation.title = "Danang"
        annotation.subtitle = "A city of Vietnam"
        mapView.addAnnotation(annotation)
        mapView.delegate = self
    }
    
    private func setupScrollView() {
        imageScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(detailViewModel.images.count), height: 0.2 * view.frame.width)
        for i in 0..<detailViewModel.images.count {
            createImage(index: i)
        }
    }
    
    private func createImage(index: Int) {
        let imageView: UIImageView = UIImageView(image: UIImage(named: detailViewModel.images[index]))
        let originPoint = CGPoint(x: imageScrollView.contentSize.width * CGFloat(index) / CGFloat(detailViewModel.images.count), y: 0)
        imageView.frame = CGRect(origin: originPoint, size: CGSize(width: view.frame.width, height: view.frame.height / 5))
        imageScrollView.addSubview(imageView)
    }
    
    private func slideTheImages() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(moveToTheNextImage), userInfo: nil, repeats: true)
    }

    @objc func moveToTheNextImage() {

        UIView.animate(withDuration: 30.0, animations: {
            for i in 1...4 {
                self.imageScrollView.contentOffset = CGPoint(x: CGFloat(i) * self.view.frame.width, y: 0)
            }
        })
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        return cell
    }
}

extension DetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            if let annotationView = annotationView {
                annotationView.canShowCallout = true
            }
            
        } else {
            if let annotationView = annotationView {
                annotationView.annotation = annotation
            }
        }

        return annotationView
    }
}

