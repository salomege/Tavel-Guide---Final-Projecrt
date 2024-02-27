//
//  CityDetailsViewModel.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import UIKit

protocol CityDetailsViewModelDelegate: AnyObject {
    func cityDetailsFetched(_ city: CityDetails)
    func showError(_ error: Error)
    func cityDetailsImageFetched(_ image: UIImage)
}

protocol CityDetailsViewModel {
    var delegate: CityDetailsViewModelDelegate? { get set }
    func viewDidLoad()
}

final class DefaultCityDetailsViewModel: CityDetailsViewModel {
    private var cityId: String
    
    weak var delegate: CityDetailsViewModelDelegate?
    
    init(cityId: String) {
        self.cityId = cityId
    }
    
    func viewDidLoad() {
        fetchCityDetails()
    }
    
    private func fetchCityDetails() {
        Task {
            do {
                let cityDetails = try await NetworkManager.shared.fetchCityDetails(for: cityId)
                delegate?.cityDetailsFetched(cityDetails)
                downloadImage(from: cityDetails.posterPath)
            } catch let error {
                delegate?.showError(error)
            }
        }
    }
    
    private func downloadImage(from url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            self?.delegate?.cityDetailsImageFetched(image ?? UIImage())
        }
    }
}
