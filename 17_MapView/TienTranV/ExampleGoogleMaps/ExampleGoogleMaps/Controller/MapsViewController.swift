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
import Alamofire

final class MapsViewController: BaseViewController {

    private weak var mapView: GMSMapView!
    private var currentLocation: CLLocation?
    private var zoomLevel: Float = 16.0
    private let path = GMSMutablePath()
    private var polyline = GMSPolyline()
    private var isFirstLocation = true

    // initialize and keep a marker and a custom infowindow
    private var tappedMarker: GMSMarker?
    private var inforWindow = CustomMarkerInfoWindow()
    private var placesClient: GMSPlacesClient!

    private let a = CLLocation(latitude: 16.0810513, longitude: 108.2331371)
    private let b = CLLocation(latitude: 16.0715256, longitude: 108.2324076)
    private let c = CLLocation(latitude: 16.0779464, longitude: 108.2355455)

    override func setupUI() {
        super.setupUI()
        configLocationServices()
        configMapView()
        configNavigation()
        showMarKer()
        placesClient = GMSPlacesClient.shared()
    }

    private func configMapView() {
        let mapView = GMSMapView(frame: UIScreen.main.bounds)
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        self.mapView = mapView
        self.mapView.delegate = self
        view.addSubview(mapView)
    }

    private func configCurrentLocation() {
        guard let currentLocation = currentLocation else { return }
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, zoom: zoomLevel)
        mapView.camera = camera
    }

    private func getCurrenPlace() {
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) | UInt(GMSPlaceField.placeID.rawValue))!
        placesClient.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: fields) { (placeLikelihoodList: Array<GMSPlaceLikelihood>?, error: Error?) in
            if let error = error {
                print("An error occurred: \(error.localizedDescription)")
                return
            }

            if let placeLikelihoodList = placeLikelihoodList {
                for likelihood in placeLikelihoodList {
                    let place = likelihood.place
                    print("Current Place name \(String(describing: place.name)) at likelihood \(likelihood.likelihood)")
                    print("Current PlaceID \(String(describing: place.placeID))")
                }
            }
        }
    }

    private func configLocationServices() {
        SceneDelegate.shared.locationManager = CLLocationManager()
        SceneDelegate.shared.locationManager?.delegate = self
    }

    private func addMarkersInToMapView (location: CLLocation, name: String) {
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        marker.title = name
        marker.snippet = "KCN An Đồn"
        marker.appearAnimation = .pop
        marker.map = mapView
    }

    private func configNavigation() {
        let leftBarButonItem = UIBarButtonItem(title: "Start", style: .done, target: self, action: #selector(startStandardLocationService))
        let showmarkerBarButonItem = UIBarButtonItem(title: "Show marker", style: .done, target: self, action: #selector(showMarKer))
        let clearBarButonItem = UIBarButtonItem(title: "Clear Map", style: .done, target: self, action: #selector(clearMapView))
        let rightBarButonItem = UIBarButtonItem(title: "Stop", style: .done, target: self, action: #selector(stopStandardLocationService))
        navigationItem.leftBarButtonItems = [leftBarButonItem, showmarkerBarButonItem]
        navigationItem.rightBarButtonItems = [rightBarButonItem, clearBarButonItem]
    }

    @objc private func showMarKer() {
        addMarkersInToMapView(location: a, name: "A")
        addMarkersInToMapView(location: b, name: "B")
        addMarkersInToMapView(location: c, name: "C")
    }
    @objc private func startStandardLocationService() {
        print("Start")
        SceneDelegate.shared.startStandardLocationService()
        configCurrentLocation()
        getCurrenPlace()
    }

    @objc private func stopStandardLocationService() {
        print("Stop")
        SceneDelegate.shared.stopStandardLocationService()
    }

    @objc private func clearMapView() {
        mapView.clear()
    }

    //Rrequesting Alamofire
    func drawPath(fromLocation: CLLocation, toLocation: CLLocation) {
        let origin = "\(fromLocation.coordinate.latitude),\(fromLocation.coordinate.longitude)"
        let destination = "\(toLocation.coordinate.latitude),\(toLocation.coordinate.longitude)"

        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&key=AIzaSyC-b5FJ-E5kQh3Gk0EO8DWxj5lCVgwOG8o"

        //Rrequesting Alamofire
        Alamofire.request(url).responseJSON { response in
            guard let data = response.data else { return }
            let json = data.convertToJSON(from: data)
            guard let routes = json["routes"] as? [[String: Any]] else { return }

            for route in routes
            {
                let routeOverviewPolyline = route["overview_polyline"] as? [String: Any]
                let points = routeOverviewPolyline?["points"] as? String
                guard let pointsC = points else { continue }
                let path = GMSPath(fromEncodedPath: pointsC)
                let polyline = GMSPolyline(path: path)
                polyline.strokeColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                polyline.strokeWidth = 5
                polyline.map = self.mapView
            }

        }
    }
}
extension MapsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        let camera = GMSCameraPosition.camera(withLatitude: lastLocation.coordinate.latitude,
            longitude: lastLocation.coordinate.longitude,
            zoom: zoomLevel)
        mapView.animate(to: camera)

        path.add(CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude))

        polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 10.0
        polyline.geodesic = true
        polyline.map = mapView
    }
}

extension MapsViewController: GMSMapViewDelegate {

    // empty the default infowindow
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }

    // reset custom infowindow whenever marker is tapped
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let location = CLLocationCoordinate2D(latitude: marker.position.latitude, longitude: marker.position.longitude)
        tappedMarker = marker
        inforWindow.removeFromSuperview()
        if let inforWindowTmp = Bundle.main.loadNibNamed("CustomMarkerInfoWindow", owner: self, options: nil)?.first as? CustomMarkerInfoWindow {
            inforWindow = inforWindowTmp
        }
        inforWindow.delegate = self
        // get data to configUI!!!!! ?
        inforWindow.configUI { return ("AT Company", "KCN An Don") }
        inforWindow.center = mapView.projection.point(for: location).subtractPoint(subY: 80)
        view.addSubview(inforWindow)
        return false
    }

    // let the custom infowindow follows the camera
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        guard let tappedMarker = tappedMarker else { return }
        let location = CLLocationCoordinate2D(latitude: tappedMarker.position.latitude, longitude: tappedMarker.position.longitude)
        inforWindow.center = mapView.projection.point(for: location).subtractPoint(subY: 80)
    }

    // take care of the close event
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        inforWindow.removeFromSuperview()
    }

    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        currentLocation = mapView.myLocation
        configCurrentLocation()
        return true
    }

    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        // Chi duong #waring chua dung duoc!!! phai co API key
        clearMapView()
        let tapLocation = CLLocation(latitude: marker.position.latitude, longitude: marker.position.longitude)
        addMarkersInToMapView(location: tapLocation, name: "CCC")
        guard let currentLocation = currentLocation else { return }
        drawPath(fromLocation: currentLocation, toLocation: tapLocation)
    }
}

extension MapsViewController: CustomMarkerInfoWindowDelegate {
    func customView(customView: CustomMarkerInfoWindow, needPerform action: CustomMarkerInfoWindow.Action) {
        switch action {
        case .pushToDetail:
            let locationDetail = DetailMarkerViewController()
            locationDetail.delegate = self
            pushViewController(viewcontroller: locationDetail)
        }
    }
}

extension MapsViewController: DetailMarkerViewControllerDelegate {
    func viewController(viewController: DetailMarkerViewController, needPerfrom action: DetailMarkerViewController.Action) {
        print("DetailMarkerViewControllerDelegate")
        switch action {
        case .updateMarker(let titleTF, let snippetTF):
            print("Update Marker: \(titleTF), \(snippetTF)")
        }
    }
}
