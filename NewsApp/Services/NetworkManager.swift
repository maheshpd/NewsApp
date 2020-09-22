//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Mahesh Prasad on 22/09/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import Foundation

class NetworkManager {
    private let baseUrlString = "https://newsapi.org/v2/"
    private let usTopHeadline = "top-headlines?country=us"
    
    func getNews(completion: @escaping (([News]?)  -> Void)) {
        let urlString = "\(baseUrlString)\(usTopHeadline)&apiKey=\(API.key)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsRes = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsRes == nil ? completion(nil) : completion(newsRes!.article)
            
        }.resume()
        
    }
}
