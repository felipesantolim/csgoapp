//
//  Repository.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

public protocol Repository {
    func handleRequestSuccess<T: Decodable>(result: RequestResult, completion: @escaping ((Result<T, Error>) -> Void))
}

public extension Repository {
    
    func handleRequestSuccess<T: Decodable>(result: RequestResult, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let resultData = result.data as? Data else {
            completion(.failure(GenericRequestError.invalidJSON))
            return
        }
        do {
            let dtoModel = try JSONDecoder().decode(T.self, from: resultData)
            completion(.success(dtoModel))
        } catch {
            completion(.failure(error))
        }
    }
}
