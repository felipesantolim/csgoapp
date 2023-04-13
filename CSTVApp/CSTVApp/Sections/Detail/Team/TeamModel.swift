//
//  TeamModel.swift
//  CSTVApp
//
//  Created by Felipe Santolim on 13/04/23.
//

import Foundation

// MARK: - TeamModel
struct TeamModel: Codable {
    let imageURL: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case name
    }
}

// MARK: - CurrentVideogame
struct CurrentVideogame: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - Player
struct Player: Codable {
    let age: Int?
    let birthday, firstName: String?
    let id: Int?
    let imageURL: String?
    let lastName: String?
    let modifiedAt: Date?
    let name, nationality: String?
    let slug: String?

    enum CodingKeys: String, CodingKey {
        case age, birthday
        case firstName = "first_name"
        case id
        case imageURL = "image_url"
        case lastName = "last_name"
        case modifiedAt = "modified_at"
        case name, nationality, slug
    }
}
