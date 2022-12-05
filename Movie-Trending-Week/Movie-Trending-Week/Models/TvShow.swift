//
//  TvShow.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import Foundation

struct TvShow: Codable {
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
        case title = "name"
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "first_air_date"
        case averageValueVote = "vote_average"
        case voteTotal = "vote_count"
    }
}
