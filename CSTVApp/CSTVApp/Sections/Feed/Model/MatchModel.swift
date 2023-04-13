//
//  File.swift
//  App
//
//  Created by Felipe Santolim on 12/04/23.
//

import Foundation

// MARK: - MatchModelElement
struct MatchModelElement: Codable {
    let opponents: [Opponent]?

    enum CodingKeys: String, CodingKey {
        case opponents
    }
}

// MARK: - Opponent
struct Opponent: Codable {
    let opponent: OpponentClass?
}

// MARK: - OpponentClass
struct OpponentClass: Codable {
    let imageURL: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case name
    }
}

// MARK: - Result
struct ResultValue: Codable {
    let score, teamID: Int?

    enum CodingKeys: String, CodingKey {
        case score
        case teamID = "team_id"
    }
}
