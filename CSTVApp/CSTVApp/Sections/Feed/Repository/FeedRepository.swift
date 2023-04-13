//
//  FeedRepository.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

// MARK: - Repository protocol

protocol FeedRepositoryProtocol: Repository {
    func fetchAll(completion: @escaping ((Result<[MatchModelElement], Error>) -> Void))
}

// MARK: - Repository implementation

class FeedRepository: FeedRepositoryProtocol {

    private let requestProvier: RequestProviderProtocol
    
    init(requestProvider: RequestProviderProtocol) {
        self.requestProvier = requestProvider
    }
    
    func fetchAll(completion: @escaping ((Result<[MatchModelElement], Error>) -> Void)) {
        
        requestProvier.api(completion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .success(let requestResult):
                self.handleRequestSuccess(result: requestResult, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
