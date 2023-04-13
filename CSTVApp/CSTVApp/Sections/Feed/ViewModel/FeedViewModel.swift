//
//  FeedViewModel.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

protocol FeedViewModelProtocol: AnyObject {
    var model: Observer<[MatchModelElement]> { get set }
    var loading: Observer<Bool> { get set }
    
    func fetchAll()
}

// MARK: - Repository implementation

class FeedViewModel: FeedViewModelProtocol {
    
    var model: Observer<[MatchModelElement]> = Observer(nil)
    var loading: Observer<Bool> = Observer(true)
    
    let repository: FeedRepositoryProtocol
    
    init(repository: FeedRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchAll() {
        repository.fetchAll { [weak self] result in
            switch result {
            case .success(let value):
                self?.loading.value = false
                self?.model.value = value.filter { $0.opponents?.count ?? 0 == 2}
            case .failure:
                self?.loading.value = false
                self?.model.value = nil
            }
        }
    }
}
