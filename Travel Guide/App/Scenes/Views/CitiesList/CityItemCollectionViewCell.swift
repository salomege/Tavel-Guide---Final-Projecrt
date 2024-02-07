//
//  CityItemCollectionViewCell.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import UIKit

final class CityItemCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    private let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
//    private let favoriteButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.tintColor = .green
//        button.setImage(UIImage(systemName: "heart"), for: .normal)
//        return button
//    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        //label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        //label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleGenreStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, genreLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        //setupButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - CellLifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cityImageView.image = nil
        genreLabel.text = nil
        titleLabel.text = nil
       // favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }

    // MARK: - Private Methods
    private func addSubview() {
        contentView.addSubview(cityImageView)
        contentView.addSubview(topButtonStackView)
        contentView.addSubview(titleGenreStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityImageView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            topButtonStackView.topAnchor.constraint(equalTo: cityImageView.topAnchor, constant: 8),
            topButtonStackView.leadingAnchor.constraint(equalTo: cityImageView.leadingAnchor, constant: 8),
            topButtonStackView.trailingAnchor.constraint(equalTo: cityImageView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            titleGenreStackView.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 8),
            titleGenreStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleGenreStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
//        let topRightButton = createTopButton()
//        topButtonStackView.addArrangedSubview(favoriteButton)
//        topButtonStackView.addArrangedSubview(topRightButton)
    }

//    private func setupButtonAction() {
//        favoriteButton.addAction(
//            UIAction(
//                title: "",
//                handler: { [weak self] _ in
//                    let isFavorite = self?.favoriteButton.currentImage == UIImage(systemName: "heart.fill")
//                    self?.favoriteButton.setImage(UIImage(systemName: isFavorite ? "heart" : "heart.fill"), for: .normal)
//                }
//            ),
//            for: .touchUpInside
//        )
//    }
    
    // MARK: - Helper Methods
    private func createTopButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - Configuration
    func configure(with city: City) {
        titleLabel.text = city.title
        setImage(from: city.posterPath)
    }
    
    private func setImage(from url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.cityImageView.image = image
            }
        }
    }
}
