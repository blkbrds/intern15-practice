//
//  SceneDelegate.swift
//  MapView
//
//  Created by ADMIN on 8/17/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // guard let _ = (scene as? UIWindowScene) else { return }
       //LocationManager.shared().request()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = MapViewController()
        let navi = UINavigationController(rootViewController: viewController)
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
       
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
