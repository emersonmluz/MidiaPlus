//
//  Actuations.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import Foundation

struct Actuations: Codable {
    let id: Int
    let title: String?
    let name: String?
    let overview: String
    let posterPath: String
    let popularity: Double
    let releaseDate: Date?
    let firstAirDate: Date?
    let averageValueVote: Double
    let voteTotal: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case name
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case averageValueVote = "vote_average"
        case voteTotal = "vote_count"
    }
}
