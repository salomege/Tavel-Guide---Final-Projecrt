//
//  FoodAdvisorViewController.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit

final class FoodAdvisorViewController: UIViewController, UITextFieldDelegate {
    private let viewModel = FoodAdvisorViewModel()
    
    private let headerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let regionTextField = CustomTextField(fieldType: .text)
    private let submitButton = CustomButton(title: "Advise dish", hasBackground: true, fontSize: .big)
    
    
    private let resultImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [regionTextField, submitButton])
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var resultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [resultImage, resultLabel])
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
        
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addSubviews()
        setupConstraints()
        setupSubmitButtonAction()
        setupRegionTextField()
        updateHeaderImage()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            updateHeaderImage()
        }
    }

    private func updateHeaderImage() {
        if traitCollection.userInterfaceStyle == .dark {
            headerImage.image = UIImage(named: "food-dark")
        } else {
            headerImage.image = UIImage(named: "drawing-georgian-food")
        }
    }
    
    // MARK: - Private Methods
    
    private func setupBackground() {
        view.backgroundColor = UIColor(named: "Black-white")
    }
    
    private func addSubviews() {
        view.addSubview(headerImage)
        view.addSubview(mainStackView)
        view.addSubview(resultStackView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            resultStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 20),
            resultStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            resultStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        headerImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        regionTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        regionTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        resultImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        resultImage.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
    }
    
    private func setupSubmitButtonAction() {
        submitButton.addAction(
            UIAction(
                title: "",
                handler: { [weak self] action in
                    self?.submitButtonTapped()
                }
            ), for: .touchUpInside
        )
    }
    private func submitButtonTapped() {
        guard let region = regionTextField.text, !region.isEmpty
        else {
            showAlert(with: "Enter Region")
            return
        }
        self.viewModel.fetchData(regionName: region) { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async { [weak self] in
                    self?.updateUI()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    private func updateUI() {
            guard let info = viewModel.result else { return }
            
            let imageName = info.photo
            self.resultImage.image = UIImage(named: imageName)
            
            let nameAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.darkGray,
                .font: UIFont.boldSystemFont(ofSize: 18)
            ]
            
            let ingredientsAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 14)
            ]
            
            let aboutInfoAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
            
            let attributedText = NSMutableAttributedString(string: "\(info.name)\n", attributes: nameAttributes)
            attributedText.append(NSAttributedString(string: "Ingredients: \(info.ingredients)\n", attributes: ingredientsAttributes))
            attributedText.append(NSAttributedString(string: "\(info.aboutInfo)", attributes: aboutInfoAttributes))
            
            self.resultLabel.attributedText = attributedText
        }
    
    private func showAlert(with title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    private func setupRegionTextField() {
        regionTextField.delegate = self
    }
    
    private func textFieldReturned(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

