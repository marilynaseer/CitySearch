//
//  NetworkManager.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let session = URLSession.shared
    let cache = NSCache<NSString,UIImage>()
    
    private init(){
    }
 
    func fetchCities(from searchText: String,completed: @escaping (Result<SearchResult, ErrorType>) -> Void) {
        guard let url = URL(string: EndPoints.fetchCitiesURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        //passing parameters in the url
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItemToken = URLQueryItem(name: "name_startsWith", value: searchText)
        let queryItemQuery = URLQueryItem(name: "maxRows", value: "40")
        let queryItemUserName = URLQueryItem(name: "username", value: "keep_truckin")
        components?.queryItems = [queryItemToken, queryItemQuery, queryItemUserName]

        let task = session.dataTask(with: (components?.url)!) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let searchResult = try decoder.decode(SearchResult.self, from: data)
                completed(.success(searchResult))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    
}
