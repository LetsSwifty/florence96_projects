//
//  APIManager.swift
//  Gallery
//
//  Created by Yejin Hong on 2022/06/07.
//

import UIKit

class APIManager {
    let client_id: String = ""
    
    init(){}
    
    func getPhotos(_ page: Int, _ query: String, completion: @escaping([UrlInfo]) -> Void){
        let urlString = "https://api.unsplash.com/search/photos/?page=\(page)&query=\(query)&client_id=\(client_id)&per_page=30"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(SearchInfo.self, from: data)
                let value = json.results ?? [UrlInfo]()
                
                print("[APIManager] json = \(json.results!)\n")
                completion(value)
            } catch {
                print("error = \(error)")
            }
        }.resume()
    }
}

