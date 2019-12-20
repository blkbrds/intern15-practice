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

final class MapViewController: ViewController {

    //MARK: - Properties
    private var locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    private var mapView: GMSMapView!
    private var placesClient: GMSPlacesClient!
    private var zoomLevel: Float = 17.0
    private var likelyPlaces: [GMSPlace] = []
    private let defaultLocation = CLLocation(latitude: 16.080447, longitude: 108.238280)

    var selectedPlace: GMSPlace?
    var viewModel = MapViewModel()
    var markers: [GMSMarker] = []

    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        // Clear the map.
        mapView.clear()

        // Add a marker to the map.
        if selectedPlace != nil {
            let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
            marker.title = selectedPlace?.name
            marker.snippet = selectedPlace?.formattedAddress
            marker.map = mapView
        }
        listLikelyPlaces()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self

        placesClient = GMSPlacesClient.shared()

        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
            longitude: defaultLocation.coordinate.longitude,
            zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        addMarker()
        view = mapView
        mapView.isHidden = true
    }

    // Populate the array with the list of likely places.
    func listLikelyPlaces() {
        // Clean up from previous sessions.
        likelyPlaces.removeAll()

        placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
            if let error = error {
                print("Current Place error: \(error.localizedDescription)")
                return
            }

            // Get likely places and add to the list.
            if let likelihoodList = placeLikelihoods {
                for likelihood in likelihoodList.likelihoods {
                    let place = likelihood.place
                    self.likelyPlaces.append(place)
                }
            }
        })
    }

    // Prepare the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSelect" {
            if let nextViewController = segue.destination as? PlacesViewController {
                nextViewController.likelyPlaces = likelyPlaces
            }
        }
    }

    override func setupUI() {
        super.setupUI()
        title = "Map"
    }

    private func addMarker() {
        for index in 0..<viewModel.markers.count {
            markers.append(createMarker(with: viewModel.markers[index]))
        }
    }
    
    private func createMarker(with mark: Marker) -> GMSMarker {
        // Add the marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(mark.position.lat), longitude: CLLocationDegrees(mark.position.long))
        marker.title = mark.title
        marker.snippet = mark.snippet
        marker.appearAnimation = .pop
        marker.map = mapView
        return marker
    }
}

extension MapViewController: CLLocationManagerDelegate {
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")

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
