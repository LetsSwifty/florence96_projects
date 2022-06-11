//
//  APIManager.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/15.
//

import Foundation

class APIRequest {
    static let client_id = "uJu11dvRsLD_5pD3Tlay"
    static let client_secret = "g8bDFbXdeW"
    static var items: Any?
    
    static func getBookList(result: @escaping () -> ()){
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json?query=cat&display=20") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(client_id, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(client_secret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                guard error == nil && data != nil else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    return
                }
                
                let log = NSString(data: data, encoding: String.Encoding.utf8.rawValue) ?? ""
                do{
                    let itemsInDic = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.items = itemsInDic["items"]
                result()
                } catch {
                    print("JsonSerialization error: \(error)")
                }
            }
        }
        task.resume()
    }
}
