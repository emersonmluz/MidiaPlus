//
//  MidiasTv.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import Foundation

struct MidiasTv: Codable {
    let tvShowList: [TvShow]
    
    enum CodingKeys: String, CodingKey {
        case tvShowList = "results"
    }
}
