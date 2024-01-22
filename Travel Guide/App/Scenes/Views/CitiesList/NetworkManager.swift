//
//  NetworkManager.swift
//  Travel Guide
//
//  Created by salome on 18.01.24.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()

    
    private init() {}
    
    // MARK: - Fetch Cities
    func fetchCities(completion: @escaping (Result<[City], Error>) -> Void) {
        let urlStr = "https://mocki.io/v1/0f3f3e77-04b0-4339-9415-ce9ad67c4910"
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let citiesResponse = try JSONDecoder().decode(CitiesResponse.self, from: data)
                completion(.success(citiesResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - Download Image
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://drive.google.com/uc?id=\(urlString)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
}

// MARK: - Fetch City Details
extension NetworkManager {
    func fetchCityDetails(for id: Int) async throws -> CityDetails {
        let urlStr = ""
        
        guard let url = URL(string: urlStr) else {
            throw NSError(domain: "com.yourdomain.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let cityDetail = try JSONDecoder().decode(CityDetails.self, from: data)
                return cityDetail
            } catch {
                throw NSError(domain: "com.yourdomain.app", code: -2, userInfo: [NSLocalizedDescriptionKey: "Decoding error: \(error.localizedDescription)"])
            }
        } catch {
            throw NSError(domain: "com.yourdomain.app", code: -3, userInfo: [NSLocalizedDescriptionKey: "Network request failed: \(error.localizedDescription)"])
        }
    }
}
