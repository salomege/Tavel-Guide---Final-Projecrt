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
        let urlStr = "https://mocki.io/v1/fd615d0c-52c7-4cde-8653-e0d27a4f4586"
        
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
    func fetchCityDetails(for detailsId: String) async throws -> CityDetails {
        let urlStr = "https://mocki.io/v1/\(detailsId)"

        print("NetworkManager: Constructing URL for city details: \(urlStr)") // Before URL Construction

        guard let url = URL(string: urlStr) else {
            throw NSError(domain: "com.yourdomain.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

             print("NetworkManager: Received raw response data for city details: \(data)") // After API Call

            do {
                let cityDetail = try JSONDecoder().decode(CityDetails.self, from: data)

                print("NetworkManager: Parsed CityDetails: \(cityDetail)") // Before Data Passing

                return cityDetail
            } catch {
                throw NSError(domain: "com.yourdomain.app", code: -2, userInfo: [NSLocalizedDescriptionKey: "Decoding error: \(error.localizedDescription)"])
            }
        } catch {
            throw NSError(domain: "com.yourdomain.app", code: -3, userInfo: [NSLocalizedDescriptionKey: "Network request failed: \(error.localizedDescription)"])
        }
    }
}
