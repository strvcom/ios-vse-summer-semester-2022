//
//  Model.swift
//  NetworkRequest
//
//  Created by Jan Kaltoun on 25.04.2022.
//

import Foundation

struct SearchResponse: Decodable {
    let results: [SearchResult]
}

struct SearchResult: Decodable, Identifiable {
    let id: Int
    let trackName: String
    let collectionName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case collectionName
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        trackName = try values.decode(String.self, forKey: .trackName)
        collectionName = try values.decode(String.self, forKey: .collectionName)
    }
}
