//
//  CityDetailsViewController.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import UIKit

final class CityDetailsViewController: UIViewController {

    // MARK: - UI Components

    private let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topPlaces: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var viewModel: CityDetailsViewModel

    // MARK: - Init
    init(cityId: String) {
        viewModel = DefaultCityDetailsViewModel(cityId: cityId)
        super.init(nibName: nil, bundle: nil)

        viewModel.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
    }

    // MARK: - Private Methods
    private func setup() {
        view.backgroundColor = UIColor(named: "BackColor")

        setupCityImageView()
        setupScrollView()
        setupScrollViewContainer()
        setupDescriptionLabel()
        setupTopPlaces()
    }

    private func setupCityImageView() {
        view.addSubview(cityImageView)
        NSLayoutConstraint.activate([
            cityImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cityImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 30),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        scrollView.addSubview(scrollViewContainer)

        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupScrollViewContainer() {
        // Add your stack view arranged subviews here
    }

    private func setupDescriptionLabel() {
        scrollViewContainer.addArrangedSubview(descriptionLabel)
    }
    private func setupTopPlaces() {
        scrollViewContainer.addArrangedSubview(topPlaces)
    }
}

// MARK: - CityDetailsViewModelDelegate
extension CityDetailsViewController: CityDetailsViewModelDelegate {
    func cityDetailsFetched(_ city: CityDetails) {
        Task {
            navigationItem.title = city.title
            descriptionLabel.text = city.overview
//          let topPlacesText = city.topPlaces.map { $0.name }.joined(separator: ", ")
//                       topPlaces.text = "Top Places: \(topPlacesText)"

        }
    }

    func showError(_ error: Error) {
        print("Error")
    }

    func cityDetailsImageFetched(_ image: UIImage) {
        Task {
            cityImageView.image = image
        }
    }
}

