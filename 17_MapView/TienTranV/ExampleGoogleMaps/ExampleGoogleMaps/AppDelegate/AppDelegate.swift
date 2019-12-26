//
//  AppDelegate.swift
//  ExampleGoogleMaps
//
//  Created by TranVanTien on 12/24/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

let googleApiKey = "AIzaSyCbD630IEuUgz6A5NIyxtSOe0xZcpX4bTw"
//let googleApiKey = "AIzaSyDPKyGEBIklG4P4b0ee0W98vEam08zsGvM"

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(googleApiKey)
        GMSPlacesClient.provideAPIKey(googleApiKey)
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration { return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}

