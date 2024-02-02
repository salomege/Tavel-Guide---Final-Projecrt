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
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance

            tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor(named: "AccentColor")
            tabBar.unselectedItemTintColor = .systemGray2
        }
    
    // MARK: - Methods
    
    private func setupTabs() {
        
//        let home = createNavigation("Home", UIImage(systemName: "house"), controller: HomePageViewController())
        let places = createNavigation("Top Places", UIImage(systemName: "mountain.2"), controller: CitiesListViewController())
        
        let locationsViewModel = LocationsViewModel()
        let map = createNavigation("Map", UIImage(systemName: "mappin.and.ellipse"), controller: UIHostingController(rootView: LocationsView().environmentObject(locationsViewModel)))
        let foodAdvisor = createNavigation("Food Advisor", UIImage(systemName: "fork.knife"), controller: FoodAdvisorViewController())

        let impressionsViewModel = ImpressionsViewModel()
                    let impressions = createNavigation("Impressions", UIImage(systemName: "person.3.fill"), controller: UIHostingController(rootView: ImpressionsView().environmentObject(impressionsViewModel)))
        
        
        
        setViewControllers([/*home,*/ places, map, foodAdvisor, impressions], animated: true)
    }
    
    
    private func createNavigation(_ title: String, _ image: UIImage?, controller: UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationItem.title = "nav title"
        navController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        navController.viewControllers.first?.navigationItem.title = title
        return navController
    }
    
}

