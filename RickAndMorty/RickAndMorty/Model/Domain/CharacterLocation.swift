//
//  CharacterLocation.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 30.01.2022.
//

import Foundation

struct CharacterLocation {
    let name: String
    let locationId: Int?
    
    init(name: String, url: URL?) {
        self.name = name
        
        if let url = url {
            locationId = Int(url.lastPathComponent)
        } else {
            locationId = nil
        }
    }
}

// MARK: - Conformances
extension CharacterLocation: Equatable {}
extension CharacterLocation: Decodable {}

// MARK: - Mock
#if DEBUG
extension CharacterLocation {
    static let mock: CharacterLocation = .init(
        name: "Earth",
        url: URL(string: "https://rickandmortyapi.com/api/location/20")!
    )
}
#endif
