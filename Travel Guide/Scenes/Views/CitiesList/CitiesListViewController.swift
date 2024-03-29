//
//  CitiesListViewController.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit

final class CitiesListViewController: UIViewController {
    
    
    // MARK: - Properties
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = -6
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var cities = [City]()
    private let viewModel = CitiesListViewModel()
    private var loader: UIAlertController?
    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViewModelDelegate()
        viewModel.viewDidLoad()
        loadDataWithLoader()
        
    }
    
    // MARK: - Private Methods
    private func setup() {
        view.backgroundColor = UIColor(named: "BackColor")
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.register(CityItemCollectionViewCell.self, forCellWithReuseIdentifier: "CityItemCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

// MARK: - CollectionView DataSource
extension CitiesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityItemCell", for: indexPath) as? CityItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: cities[indexPath.row])
        return cell
    }
}


// MARK: - CollectionView FlowLayoutDelegate
extension CitiesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + flowLayout.minimumInteritemSpacing
        
        let width = Int((collectionView.bounds.width - totalSpace) / 2)
        let height = 280
        
        return CGSize(width: width, height: height)
    }
}

// MARK: - CollectionView Delegate
extension CitiesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectCity(at: indexPath)
    }
}

// MARK: - CitiesListViewModelDelegate
extension CitiesListViewController: CitiesListViewModelDelegate {
    func citiesFetched(_ cities: [City]) {
        if let loader = self.loader {
            LoaderHelper.stopLoader(loader: loader)
        }
        
        self.cities = cities
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        if let loader = self.loader {
            LoaderHelper.stopLoader(loader: loader)
        }
        print("Error: \(error.localizedDescription)")
    }
    
    
    func navigateToCityDetails(with cityId: String) {
        let viewController = CityDetailsViewController(cityId: cityId)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func loadDataWithLoader() {
        loader = LoaderHelper.loader(in: self.view)
        viewModel.fetchCities()
    }
}
