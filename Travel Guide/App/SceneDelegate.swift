//
//  SceneDelegate.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        let controller = TabBarController()
//        let navController = UINavigationController(rootViewController: controller)
        window?.rootViewController = controller
    }

}
