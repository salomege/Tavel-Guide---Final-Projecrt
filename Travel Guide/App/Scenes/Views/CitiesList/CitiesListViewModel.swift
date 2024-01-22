//
//  CitiesListViewModel.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import Foundation

protocol CitiesListViewModelDelegate: AnyObject {
    func citiesFetched(_ cities: [City])
    func showError(_ error: Error)
    func navigateToCityDetails(with cityId: Int)
}

final class CitiesListViewModel {
    private var cities: [City]?
    
    weak var delegate: CitiesListViewModelDelegate?
    
    func viewDidLoad() {
        fetchCities()
    }
    
    func didSelectCity(at indexPath: IndexPath) {
        if let cityId = cities?[indexPath.row].id {
            delegate?.navigateToCityDetails(with: cityId)
        }
    }
    
    private func fetchCities() {
        NetworkManager.shared.fetchCities { [weak self] result in
            switch result {
            case .success(let cities):
                self?.cities = cities
                self?.delegate?.citiesFetched(cities)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
