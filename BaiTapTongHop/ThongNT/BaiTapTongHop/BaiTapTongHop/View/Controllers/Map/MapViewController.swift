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

protocol MapViewControllerDataSource: class {
    func getPlaces() -> [GooglePlace]
}

final class MapViewController: ViewController {

    // MARK: - Properties
    private let defaultLocation = CLLocation(latitude: 16.080447, longitude: 108.238280)
    private var locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    private var placesClient: GMSPlacesClient!
    private var mapView: GMSMapView!
    private var zoomLevel: Float = 14.0
    private var path: GMSPolyline!
    
    
    var originLatitude: Double = 0
    var originLongtitude: Double = 0
    var destinationLatitude: Double = 0
    var destinationLongtitude: Double = 0
    var travelMode = TravelModes.driving
    let directionService = DirectionService()

    
    weak var dataSource: MapViewControllerDataSource?
    var selectedPlace: GMSPlace?
    var viewModel = MapViewModel()

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        setupNavigation()
        setupMap()
    }

    // MARK: - Setup Data
    override func setupData() {
        super.setupData()
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
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        navigationItem.leftBarButtonItem = homeButton
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
        view = mapView
    }
    
    private func addMarkerIntoMap() {
        viewModel.markers.forEach { $0.map = mapView }
    }
}

extension MapViewController {
    
    private func direction() {
        self.mapView.clear()
        let origin: String = "\(currentLocation?.coordinate.latitude),\(currentLocation?.coordinate.longitude)"
        let destination: String = "\(destinationLatitude),\(destinationLongtitude)"
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: destinationLatitude, longitude: destinationLongtitude))
        marker.map = self.mapView
        self.directionService.getDirections(origin: origin,
            destination: destination,
            travelMode: travelMode) { [weak self] (success) in
            if success {
                DispatchQueue.main.async {
                    self?.drawRoute()
                    if let totalDistance = self?.directionService.totalDistance,
                        let totalDuration = self?.directionService.totalDuration {
//                        self?.detailDirection.text = totalDistance + ". " + totalDuration
//                        self?.detailDirection.isHidden = false
                    }
                }
            } else {
                print("error direction")
            }
        }
    }

    private func drawRoute() {
        for step in self.directionService.selectSteps {
            if step.polyline.points != "" {
                let path = GMSPath(fromEncodedPath: step.polyline.points)
                let routePolyline = GMSPolyline(path: path)
                routePolyline.strokeColor = UIColor.red
                routePolyline.strokeWidth = 3.0
                routePolyline.map = mapView
            } else {
                return
            }
        }
    }
    
    private func afterDirection() {
        self.directionService.totalDistanceInMeters = 0
        self.directionService.totalDurationInSeconds = 0
        self.directionService.selectLegs.removeAll()
        self.directionService.selectSteps.removeAll()
    }
    
    @objc private func goToHome() {
        tabBarController?.selectedIndex = 0
    }
}

// MARK: - GMS MapView Delegate
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        // tap on annotation
        print("Click on annotation")
        self.destinationLatitude = marker.position.latitude
        self.destinationLongtitude = marker.position.longitude
        direction()
        afterDirection()
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
