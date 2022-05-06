//
//  NetworkManager.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import Foundation

class NetworkManager {
    
    //MARK: - URL Variables
    let imageCache = NSCache<NSString, NSData>()
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURLString = "https://newsapi.org/v2/"
    private let USTopHeadline = "top-headlines?country=us"
    
    //MARK: - API Call Get News
    func getNews(completion: @escaping ([News]?) -> Void) {
        let urlString = "\(baseURLString)\(USTopHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsBox = try? JSONDecoder().decode(NewsBox.self, from: data)
            newsBox == nil ? completion(nil) : completion(newsBox!.articles)
            
        }.resume()
    }
    
    //MARK: - API Call Get News Image
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
                
            }.resume()
        }
    }
}
