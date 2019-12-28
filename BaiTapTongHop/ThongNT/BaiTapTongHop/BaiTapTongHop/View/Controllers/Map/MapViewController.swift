//
//  MapViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/22/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire

protocol MapViewControllerDataSource: class {
    func getPlaces() -> [GooglePlace]
}

final class MapViewController: ViewController {

    // MARK: - Properties
    private lazy var infoView = Bundle.main.loadNibNamed("DirectionView", owner: nil, options: nil)?[0] as? DirectionView
    private let defaultLocation = CLLocation(latitude: 16.080447, longitude: 108.238280)
    private var locationManager = CLLocationManager()
    private var currentLocation = CLLocation()
    private var distinationLocation = CLLocation()
    private var placesClient: GMSPlacesClient!
    private var mapView: GMSMapView!
    private var zoomLevel: Float = 14.0
    private var path: GMSPolyline!

    var originLatitude: Double = 0
    var originLongtitude: Double = 0
    var destinationLatitude: Double = 0
    var destinationLongtitude: Double = 0
    var travelMode = TravelModes.driving


    weak var dataSource: MapViewControllerDataSource?
    var selectedPlace: GMSPlace?
    var viewModel = MapViewModel()

    // MARK: - Life cycle
    override func setupUI() {
        super.setupUI()
        setupNavigation()
        setupMap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        getMarkers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addMarkerIntoMap()
    }
}

// MARK: - Setup Data
extension MapViewController {

    private func getData() {
        guard let places = dataSource?.getPlaces() else { return }
        viewModel.places = places
    }

    private func getMarkers() {
        viewModel.createMakers()
    }
}

// MARK: - Setup UI
extension MapViewController {

    private func setupNavigation() {
        title = "Map"
    }

    private func setupMap() {
        // Initialize the location manager
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 100
        locationManager.startUpdatingLocation()
        locationManager.delegate = self

        placesClient = GMSPlacesClient.shared()

        // Create a map
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude, longitude: defaultLocation.coordinate.longitude, zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        mapView.frame = view.bounds
        view.addSubview(mapView)
    }

    private func addMarkerIntoMap() {
        viewModel.markers.forEach { $0.map = mapView }
    }
}

// MARK: - Conform Direction on Google Map
extension MapViewController {

    private func prepareForDirection() {
        self.mapView.clear()
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: destinationLatitude, longitude: destinationLongtitude))
        marker.appearAnimation = .pop
        marker.map = self.mapView
    }
    
    // Draw a path on google map view
    private func direction() {
        prepareForDirection()
        viewModel.getPoints(currentLocation: currentLocation, destinationLocation: distinationLocation, travelMode: travelMode) { (done, stringResult) in
            if done {
                // Create a direction path
                let path = GMSPath.init(fromEncodedPath: stringResult)
                let polyline = GMSPolyline.init(path: path)
                polyline.strokeColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
                polyline.strokeWidth = 3
                polyline.map = self.mapView
            } else {
                self.alert(title: App.Home.alertTitle, msg: stringResult, buttons: ["OK"], preferButton: "OK", handler: nil)
            }
        }
    }
}

// MARK: - GMS Google Delegate
extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        // tap on annotation
        print("Click on annotation")
        self.destinationLatitude = marker.position.latitude
        self.destinationLongtitude = marker.position.longitude
        distinationLocation = CLLocation(latitude: destinationLatitude, longitude: destinationLongtitude)
        print("---------Directioning-------------")
        direction()
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        getMarkers()
        addMarkerIntoMap()
    }
}

// MARK: - CLLocation Manager Delegate
extension MapViewController: CLLocationManagerDelegate {

    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        currentLocation = location
        print("---Location: \(location)")

        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
    }

    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted")
        case .denied:
            print("User denied access to location")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK")
            @unknown default:
            fatalError()
        }
    }

    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
