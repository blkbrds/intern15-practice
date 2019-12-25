//
//  MapsViewController.swift
//  ExampleGoogleMaps
//
//  Created by TranVanTien on 12/24/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

final class MapsViewController: BaseViewController {

    private weak var mapView: GMSMapView!
    private var currentLocation = CLLocation(latitude: 16.0803505, longitude: 108.2384165)
    private var zoomLevel: Float = 16.0
    private let path = GMSMutablePath()
    private var polyline = GMSPolyline()
    private var isFirstLocation = true

    override func setupUI() {
        super.setupUI()
        configLocationServices()
        configMapView()
        configNavigation()
    }

    private func configMapView() {
        let mapView = GMSMapView(frame: UIScreen.main.bounds)
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, zoom: zoomLevel)
        mapView.camera = camera
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        self.mapView = mapView
        self.mapView.delegate = self
        view.addSubview(mapView)
    }

    private func configLocationServices() {
        SceneDelegate.shared.locationManager = CLLocationManager()
        SceneDelegate.shared.locationManager?.delegate = self
    }

    private func addMarkersIntToMapView (location: CLLocation) {

        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        marker.title = "AT Company"
        marker.snippet = "KCN An Đồn"
        marker.appearAnimation = .pop
        marker.map = mapView
    }

    private func configNavigation() {
        let leftBarButonItem = UIBarButtonItem(title: "Start", style: .done, target: self, action: #selector(startStandardLocationService))
        let clearBarButonItem = UIBarButtonItem(title: "Clear Map", style: .done, target: self, action: #selector(clearMapView))
        navigationItem.leftBarButtonItem = leftBarButonItem

        let rightBarButonItem = UIBarButtonItem(title: "Stop", style: .done, target: self, action: #selector(stopStandardLocationService))
        navigationItem.rightBarButtonItems = [rightBarButonItem, clearBarButonItem]
    }

    @objc private func startStandardLocationService() {
        SceneDelegate.shared.startStandardLocationService()
    }

    @objc private func stopStandardLocationService() {
        SceneDelegate.shared.stopStandardLocationService()
    }

    @objc private func clearMapView() {
        mapView.clear()
    }
}

extension MapsViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        if isFirstLocation {
            isFirstLocation = false
            currentLocation = lastLocation
            print("Timestamp: \(lastLocation.timestamp)")
            print("Location latitude: \(lastLocation.coordinate.latitude)")
            print("Location longitude: \(lastLocation.coordinate.longitude)\n-----")
        }
        let camera = GMSCameraPosition.camera(withLatitude: lastLocation.coordinate.latitude,
            longitude: lastLocation.coordinate.longitude,
            zoom: zoomLevel)

        mapView.clear()
        addMarkersIntToMapView(location: lastLocation)
        mapView.animate(to: camera)

        path.add(CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude))

        polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 10.0
        polyline.geodesic = true
        polyline.map = mapView
    }
}

extension MapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        guard let inforWindow = Bundle.main.loadNibNamed("CustomMarkerInfoWindow", owner: self, options: nil)?.first as? CustomMarkerInfoWindow else { return UIView() }
        inforWindow.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        inforWindow.backgroundColor = .white
        inforWindow.clipsToBounds = true
        inforWindow.layer.cornerRadius = 10
        inforWindow.configUI(title: "AT Company", snippet: "KCN An Đồn")
        return inforWindow
    }
}
