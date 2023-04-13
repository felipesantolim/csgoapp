//
//  FeedProtocol.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public final class FeedProvider {}

extension FeedProvider: RequestProviderProtocol {
    
    public func api(completion: completionHandler?) {
        let headers = [
          "accept": "application/json",
          "authorization": "Bearer jGJ-1GKKt6Fbbz2T3hPzjagmqPhEkKVqtXh9BHvaK0vXHpUx1N0"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.pandascore.co/csgo/matches?sort=&page=1&per_page=50")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 60.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              completion?(.success(.init(data: data, urlResponse: response, statusCode: 200)))
          }
        })

        dataTask.resume()
    }
}
