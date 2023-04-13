//
//  DetailProviderProtocol.swift
//  CSTVApp
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public final class DetailProvider {}

extension DetailProvider: RequestProviderProtocol {
    
    public func api(completion: completionHandler?) {
        let headers = [
          "accept": "application/json",
          "authorization": "Bearer jGJ-1GKKt6Fbbz2T3hPzjagmqPhEkKVqtXh9BHvaK0vXHpUx1N0"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.pandascore.co/teams/131124")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
          }
        })

        dataTask.resume()
    }
}
