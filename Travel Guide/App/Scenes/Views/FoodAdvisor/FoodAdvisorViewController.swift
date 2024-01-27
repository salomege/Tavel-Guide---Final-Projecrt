//
//  FoodAdvisorViewController.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit

final class FoodAdvisorViewController: UIViewController, UITextFieldDelegate {
    
    private let regionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Region"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Advise dish", for: .normal)
        button.backgroundColor = UIColor(named: "AccentColor")
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let resultImage: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true // Ensures image doesn't overflow its bounds
           return imageView
       }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 227/255.0, green: 249/255.0, blue: 238/255.0, alpha: 1.0)

        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [regionTextField, submitButton, resultImage, resultLabel])
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    var viewModel = FoodAdvisorViewModel()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        addSubviews()
        setupConstraints()
        setupSubmitButtonAction()
        setupRegionTextField()
        
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .white
    }
    private func addSubviews() {
        view.addSubview(mainStackView)
        
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        regionTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    private func setupSubmitButtonAction() {
        submitButton.addAction(
            UIAction(
                title: "",
                handler: { [weak self] action in
                    self?.submitButtonTapped()
                }
            ),for: .touchUpInside
        )}
    private func submitButtonTapped() {
        guard let region = regionTextField.text, !region.isEmpty
                
        else {
            showAlert(with: "Enter Region")
            return
            
        }
        
        self.viewModel.fetchData(regionName: region) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(_): // No need to use dishData here
                print("Data fetched successfully")
                self.updateUI() // Call updateUI directly
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
    private func updateUI() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let info = self.viewModel.result else { return }

            // Set the image using the image name (assuming the image is part of your app's assets)
            let imageName = info.photo
            self.resultImage.image = UIImage(named: imageName)

            // Construct the text to display
            let resultText = "Name: \(info.name)\nIngredients: \(info.ingredients)\nAbout: \(info.aboutInfo)"
            self.resultLabel.text = resultText
        }
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

