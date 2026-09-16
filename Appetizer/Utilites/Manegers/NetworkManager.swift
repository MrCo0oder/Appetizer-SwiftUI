//
//  NetworkManager.swift
//  Appetizer
//
//  Created by 34ml on 15/08/2026.
//
import Foundation
import UIKit

final class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()

    static let BASE_URL = "https://6979bdb3cc9c576a8e17871b.mockapi.io/v1/"
    static let listEndpoint = BASE_URL + "AppetizerList"
    private init() {}
    //
    //    func getAppetizers(
    //        completed: @escaping (Result<[AppetizerModel], APError>) -> Void
    //    ) {
    //        guard let url = URL(string: NetworkManager.listEndpoint) else {
    //            completed(.failure(.invalidUrl))
    //            return
    //        }
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
    //            data,
    //            response,
    //            error
    //            in
    //            guard error == nil else {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //            guard let response = response as? HTTPURLResponse,
    //                response.statusCode == 200
    //            else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //            do {
    //                let decoder = JSONDecoder()
    //
    //                let decodedResponse = try decoder.decode(
    //                    [AppetizerModel].self,
    //                    from: data
    //                )
    //                completed(.success(decodedResponse))
    //            } catch {
    //                print("Decoding error: \(error)")
    //
    //                completed(.failure(.invalidResponse))
    //            }
    //        }
    //        task.resume()
    //    }
    func getAppetizers() async throws -> [AppetizerModel] {
        guard let url = URL(string: NetworkManager.listEndpoint) else {
            throw APError.invalidUrl
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()

            return try decoder.decode(
                [AppetizerModel].self,
                from: data
            )

        } catch {
            print("Decoding error: \(error)")
            throw APError.invalidResponse
        }
    }
    func downloadImage(
        fromUrlString: String,
        completed: @escaping (UIImage?) -> Void
    ) {
        let cacheKey = NSString(string: fromUrlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: fromUrlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data,
            response,
            error
            in
            guard let data , let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }

}
