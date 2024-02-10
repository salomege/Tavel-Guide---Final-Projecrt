//
//  ViewController.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
        }
        
        setupTabs()
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = .systemBackground
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "TabBarText") ?? .white]


        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor(named: "AccentColor")
        tabBar.unselectedItemTintColor = .systemGray2
    
    }
    
    // MARK: - Methods
    
    private func setupTabs() {
        
        let places = createNavigation(
            "Top Places",
            UIImage(systemName: "mountain.2"),
            controller: CitiesListViewController()
        )
        
        let locationsViewModel = LocationsViewModel()
        let map = createNavigation(
            "Map",
            UIImage(systemName: "mappin.and.ellipse"),
            controller: UIHostingController(
                rootView: LocationsView().environmentObject(locationsViewModel)
            )
        )
        let foodAdvisor = createNavigation(
            "Food Advisor",
            UIImage(systemName: "fork.knife"),
            controller: FoodAdvisorViewController()
        )
        
        let addReviewModel = AddReviewViewModel()
        let review = createNavigation(
            "Add Review",
            UIImage(systemName: "person.3.fill"),
            controller: UIHostingController(
                rootView: AddReviewView().environmentObject(addReviewModel)
            )
        )
        
        let currencyViewModel = CurrencyViewModel()
        let currency = createNavigation(
            "Currency",
            UIImage(systemName: "larisign.arrow.circlepath"),
            controller: UIHostingController(
                rootView: CurrencyView().environmentObject(currencyViewModel))
        )
        
        
        
        setViewControllers([places, map, foodAdvisor, currency, review], animated: true)
    }
    
    
    private func createNavigation(
        _ title: String, 
        _ image: UIImage?,
        controller: UIViewController
    ) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "TabBarText") ?? .white], for: .selected)
                           
        
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: 
        #selector(logoutButtonTapped))
        controller.navigationItem.rightBarButtonItem = logoutButton
        controller.title = title
        
        return navController
    }
    
    
    @objc func logoutButtonTapped() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? 
                    SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            }
        }
    }
    

