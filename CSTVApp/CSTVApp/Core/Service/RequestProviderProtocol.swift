//
//  RequestProviderProtocol.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public struct DataModel: Codable {
    public let data: Data
}

public struct RequestResult {
    public let data: Any?
    public let urlResponse: URLResponse?
    public let statusCode: Int?
    
    public init(data: Any?, urlResponse: URLResponse?, statusCode: Int?) {
        self.data = data
        self.urlResponse = urlResponse
        self.statusCode = statusCode
    }
}

public typealias CloudHTTPResult = Result<RequestResult, Error>
public typealias completionHandler = (CloudHTTPResult) -> Void

public protocol RequestProviderProtocol {
    func api(completion: completionHandler?)
}
