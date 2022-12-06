//
//  Person.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import Foundation

struct Person: Codable {
    let id: Int
    let name: String
    let popularity: Double
    let office: String
    let profilePath: String
    let actuations: [Actuations]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case popularity
        case office = "known_for_department"
        case profilePath = "profile_path"
        case actuations = "known_for"
    }
}
