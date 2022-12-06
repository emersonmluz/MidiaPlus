//
//  PersonList.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import Foundation

struct PersonList: Codable {
    let personList: [Person]
    
    enum CodingKeys: String, CodingKey {
        case personList = "results"
    }
}
