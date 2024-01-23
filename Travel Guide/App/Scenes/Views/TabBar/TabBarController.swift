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
        setupTabs()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = .systemBackground
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .green
        tabBar.unselectedItemTintColor = .systemGray2
    }
    
    // MARK: - Methods
    
    private func setupTabs() {
        
        let home = createNavigation("Home", UIImage(systemName: "house"), controller: HomePageViewController())
        let places = createNavigation("Top Places", UIImage(systemName: "mountain.2"), controller: CitiesListViewController())
        let map = createNavigation("Map", UIImage(systemName: "mappin.and.ellipse"), controller: MapViewController())
        let foodAdvisor = createNavigation("Food Advisor", UIImage(systemName: "fork.knife"), controller: FoodAdvisorViewController())

        let impressionsViewModel = ImpressionsViewModel()
                    let impressions = createNavigation("Impressions", UIImage(systemName: "person.3.fill"), controller: UIHostingController(rootView: ImpressionsView().environmentObject(impressionsViewModel)))
        
        setViewControllers([home, places, map, foodAdvisor, impressions], animated: true)
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

