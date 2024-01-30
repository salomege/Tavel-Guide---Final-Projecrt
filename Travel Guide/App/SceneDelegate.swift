//
//  SceneDelegate.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.checkAuthentication()
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            // User is not authenticated, show LoginController
            let loginController = LoginController()
            loginController.completionHandler = { [weak self] in
                // Completion handler is called when sign-in is successful
                self?.checkAuthentication()
            }
            self.goToController(with: loginController)
        } else {
            // User is authenticated, show TabBarController
            self.goToController(with: TabBarController())
        }
    }
    
    private func goToController(with viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.25) {
                self?.window?.layer.opacity = 0
            } completion: { [weak self] _ in
                if viewController is TabBarController {
                    self?.window?.rootViewController = viewController
                } else {
                    let nav = UINavigationController(rootViewController: viewController)
                    nav.modalPresentationStyle = .fullScreen
                    self?.window?.rootViewController = nav
                }
                
                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }
}
