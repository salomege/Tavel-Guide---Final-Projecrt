//
//  HomePageViewController.swift
//  Travel Guide
//
//  Created by salome on 17.01.24.
//

import UIKit

class HomePageViewController: UIViewController {
    
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "Welcome")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let welcomeText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.text = "Welcome to Georgia!"
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore, Discover, and Enjoy Your Journey"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private let logoView: UIImageView = {
        let logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        logoImage.image = UIImage(named: "Logo_rounded-modified")
        logoImage.contentMode = .scaleAspectFit
        
        return logoImage
    }()
    
    private let logoBottomView: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(systemName: "arrowtriangle.down.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.white)
        return logoImage
    }()
    
    private let sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Travel Guide"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy private var logoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoView, logoBottomView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = -4
        return stackView
    }()
    
    private let submitButton = CustomButton(title: "Join Us", hasBackground: true, fontSize: .big)
    
    lazy private var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeText, subtitleLabel,logoStackView, sloganLabel, submitButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
       submitButton.addTarget(self, action: #selector(didTapJoinUs), for: .touchUpInside)
        
        
    }
    
    private func setup() {
        view.addSubview(welcomeImageView)
        view.sendSubviewToBack(welcomeImageView)
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            welcomeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            welcomeImageView.topAnchor.constraint(equalTo: view.topAnchor),
            welcomeImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            submitButton.heightAnchor.constraint(equalToConstant: 45),
            submitButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func didTapJoinUs() {
        let rc = RegisterController()
        self.navigationController?.pushViewController(rc, animated: true)
    }
}
