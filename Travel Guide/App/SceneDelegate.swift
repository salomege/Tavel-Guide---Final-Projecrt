//
//  SceneDelegate.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
       
    func checkAuthentication() {
        if Auth.auth().currentUser == nil {

            goToController(with: HomePageViewController())
        } else {
            // User is authenticated, check for existing user document
            let user = Auth.auth().currentUser!
            let docRef = Firestore.firestore().collection("users").document(user.uid)
            docRef.getDocument { [weak self] (document, error) in
                guard let self = self else { return }
                if error != nil {
                    // Handle error
                } else {
                    if let document = document, document.exists {
                        // Existing user, go to TabBarController
                        self.goToController(with: TabBarController())
                    } else {
                        // New user, go to homePageViewController
                        self.goToController(with: HomePageViewController())
                    }
                }
            }
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
