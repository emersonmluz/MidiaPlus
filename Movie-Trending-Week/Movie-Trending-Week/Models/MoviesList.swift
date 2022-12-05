//
//  Midias.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import Foundation

struct MoviesList: Codable {
    let moviesList: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case moviesList = "results"
    }
}
