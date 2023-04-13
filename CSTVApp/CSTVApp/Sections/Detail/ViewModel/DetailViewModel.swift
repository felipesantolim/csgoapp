//
//  DetailViewModel.swift
//  CSTVApp
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var model: Observer<[MatchModelElement]> { get set }
}

class DetailViewModel: DetailViewModelProtocol {
    
    var model: Observer<[MatchModelElement]> = Observer(nil)
}
