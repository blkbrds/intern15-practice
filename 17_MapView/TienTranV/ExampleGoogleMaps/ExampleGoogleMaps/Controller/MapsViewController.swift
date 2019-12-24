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
    private var defaultLocation = CLLocation(latitude: 16.0808229, longitude: 108.2363892)
    private var zoomLevel: Float = 16.0

    override func setupUI() {
        super.setupUI()
        configMapView()
        configLocationServices()
        addMarkerIntToMapView()
    }

    private func configMapView() {
        let mapView = GMSMapView(frame: UIScreen.main.bounds)
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude, longitude: defaultLocation.coordinate.longitude, zoom: zoomLevel)
        mapView.camera = camera
        mapView.settings.myLocationButton = true

        self.mapView = mapView
        view.addSubview(mapView)
    }

    private func configLocationServices() {
        SceneDelegate.shared.configLocationService()
    }

    private func addMarkerIntToMapView () {
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: defaultLocation.coordinate.latitude, longitude: defaultLocation.coordinate.longitude))
        marker.title = "AT Company"
        marker.snippet = "KCN An Đồn"
        marker.appearAnimation = .pop
        marker.map = mapView
    }
}
