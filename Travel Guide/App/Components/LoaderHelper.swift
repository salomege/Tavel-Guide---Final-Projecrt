//
//  LoaderHelper.swift
//  Travel Guide
//
//  Created by salome on 05.02.24.
//

import UIKit

class LoaderHelper {
    
    static func loader(in view: UIView) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        
        if let viewController = view.next as? UIViewController {
            viewController.present(alert, animated: true, completion: nil)
        } else if let window = view.window?.rootViewController {
            window.present(alert, animated: true, completion: nil)
        }
        
        return alert
    }
    
    static func stopLoader(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
}
