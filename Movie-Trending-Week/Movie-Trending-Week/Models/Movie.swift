//
//  Movie.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let popularity: Double
    let releaseDate: Date
    let averageValueVote: Float
    let voteTotal: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case averageValueVote = "vote_average"
        case voteTotal = "vote_count"
    }
}
