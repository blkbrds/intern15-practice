//
//  SceneDelegate.swift
//  ExampleGoogleMaps
//
//  Created by TranVanTien on 12/24/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    typealias Action = (String?, (() -> Void)?)

    static let shared: SceneDelegate = {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { fatalError("Can not find SceneDelegate") }
        return sceneDelegate
    }()

    var window: UIWindow?
//    lazy var locationManager = CLLocationManager()
    var locationManager: CLLocationManager?
    let mapsViewController = MapsViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()

        let navigationController = UINavigationController(rootViewController: mapsViewController)
        window?.rootViewController = navigationController
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

    func showAlert(title: String, message: String, actions: [Action]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            if let handler = action.1 {
                let alertAction = UIAlertAction(title: action.0, style: .default, handler: { (_) in
                    handler()
                })
                alert.addAction(alertAction)
            } else {
                let alertAction = UIAlertAction(title: action.0, style: .default, handler: nil)
                alert.addAction(alertAction)
            }
        }
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Location manager
extension SceneDelegate {
    func configLocationService() {
        guard let locationManager = locationManager else { return }
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            enableLocationServices()
            startStandardLocationService()
        case .denied:
            let title = "Request location service"
            let message = "Please go to setting > Privacy > Location service to turn on location service for \"Google Maps EX\""

            let action: Action = ("OK", nil)
            showAlert(title: title, message: message, actions: [action])
        case .restricted:
            break
            @unknown default:
            fatalError("authorization status error")
        }
    }

    func enableLocationServices() {
        CLLocationManager.locationServicesEnabled()
    }

    // Standard location service
    func startStandardLocationService() {
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 50
        locationManager?.startUpdatingLocation()
    }

    func stopStandardLocationService() {
        locationManager?.stopUpdatingLocation()
    }

    // Significant change location service
    func startSignificantChangeLocationService() {
        locationManager?.startMonitoringSignificantLocationChanges()
    }

    func stopSignificantChangeLocationService() {
        locationManager?.stopMonitoringSignificantLocationChanges()
    }
}

extension SceneDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            stopStandardLocationService()
        case .authorizedAlways, .authorizedWhenInUse:
            enableLocationServices()
            startStandardLocationService()
        case .notDetermined:
            break
            @unknown default:
            fatalError("authorization status error")
        }
    }
}
