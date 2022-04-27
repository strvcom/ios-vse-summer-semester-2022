//
//  Character.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

struct Character {
    let id: Int
    let name: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let imageUrl: URL
    let episodeUrls: [URL]
        
    var episodeIds: [Int] {
        episodeUrls
            .compactMap {
                Int($0.lastPathComponent)
            }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case species
        case type
        case gender
        case origin
        case location
        case imageUrl = "image"
        case episodeUrls = "episode"
    }
}

// MARK: - Conformances
extension Character: Identifiable {}
extension Character: Equatable {}
extension Character: Decodable {}

// MARK: - Mock
#if DEBUG
extension Character {
    static let mock: Character = Self.mockList.first!
    
    static let mockList: [Character] = [
        .init(
            id: 1,
            name: "Rick Sanchez",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "Earth (C-137)",
                url: .init(string: "https://rickandmortyapi.com/api/location/1")
            ),
            location: .init(
                name: "Citadel of Ricks",
                url: .init(string: "https://rickandmortyapi.com/api/location/3")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/1")!,
                .init(string: "https://rickandmortyapi.com/api/episode/2")!,
                .init(string: "https://rickandmortyapi.com/api/episode/3")!,
                .init(string: "https://rickandmortyapi.com/api/episode/4")!,
                .init(string: "https://rickandmortyapi.com/api/episode/5")!,
                .init(string: "https://rickandmortyapi.com/api/episode/6")!,
                .init(string: "https://rickandmortyapi.com/api/episode/7")!,
                .init(string: "https://rickandmortyapi.com/api/episode/8")!,
                .init(string: "https://rickandmortyapi.com/api/episode/9")!,
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/11")!,
                .init(string: "https://rickandmortyapi.com/api/episode/12")!,
                .init(string: "https://rickandmortyapi.com/api/episode/13")!,
                .init(string: "https://rickandmortyapi.com/api/episode/14")!,
                .init(string: "https://rickandmortyapi.com/api/episode/15")!,
                .init(string: "https://rickandmortyapi.com/api/episode/16")!,
                .init(string: "https://rickandmortyapi.com/api/episode/17")!,
                .init(string: "https://rickandmortyapi.com/api/episode/18")!,
                .init(string: "https://rickandmortyapi.com/api/episode/19")!,
                .init(string: "https://rickandmortyapi.com/api/episode/20")!,
                .init(string: "https://rickandmortyapi.com/api/episode/21")!,
                .init(string: "https://rickandmortyapi.com/api/episode/22")!,
                .init(string: "https://rickandmortyapi.com/api/episode/23")!,
                .init(string: "https://rickandmortyapi.com/api/episode/24")!,
                .init(string: "https://rickandmortyapi.com/api/episode/25")!,
                .init(string: "https://rickandmortyapi.com/api/episode/26")!,
                .init(string: "https://rickandmortyapi.com/api/episode/27")!,
                .init(string: "https://rickandmortyapi.com/api/episode/28")!,
                .init(string: "https://rickandmortyapi.com/api/episode/29")!,
                .init(string: "https://rickandmortyapi.com/api/episode/30")!,
                .init(string: "https://rickandmortyapi.com/api/episode/31")!,
                .init(string: "https://rickandmortyapi.com/api/episode/32")!,
                .init(string: "https://rickandmortyapi.com/api/episode/33")!,
                .init(string: "https://rickandmortyapi.com/api/episode/34")!,
                .init(string: "https://rickandmortyapi.com/api/episode/35")!,
                .init(string: "https://rickandmortyapi.com/api/episode/36")!,
                .init(string: "https://rickandmortyapi.com/api/episode/37")!,
                .init(string: "https://rickandmortyapi.com/api/episode/38")!,
                .init(string: "https://rickandmortyapi.com/api/episode/39")!,
                .init(string: "https://rickandmortyapi.com/api/episode/40")!,
                .init(string: "https://rickandmortyapi.com/api/episode/41")!,
                .init(string: "https://rickandmortyapi.com/api/episode/42")!,
                .init(string: "https://rickandmortyapi.com/api/episode/43")!,
                .init(string: "https://rickandmortyapi.com/api/episode/44")!,
                .init(string: "https://rickandmortyapi.com/api/episode/45")!,
                .init(string: "https://rickandmortyapi.com/api/episode/46")!,
                .init(string: "https://rickandmortyapi.com/api/episode/47")!,
                .init(string: "https://rickandmortyapi.com/api/episode/48")!,
                .init(string: "https://rickandmortyapi.com/api/episode/49")!,
                .init(string: "https://rickandmortyapi.com/api/episode/50")!,
                .init(string: "https://rickandmortyapi.com/api/episode/51")!
            ]
        ),
        .init(
            id: 2,
            name: "Morty Smith",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Citadel of Ricks",
                url: .init(string: "https://rickandmortyapi.com/api/location/3")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/1")!,
                .init(string: "https://rickandmortyapi.com/api/episode/2")!,
                .init(string: "https://rickandmortyapi.com/api/episode/3")!,
                .init(string: "https://rickandmortyapi.com/api/episode/4")!,
                .init(string: "https://rickandmortyapi.com/api/episode/5")!,
                .init(string: "https://rickandmortyapi.com/api/episode/6")!,
                .init(string: "https://rickandmortyapi.com/api/episode/7")!,
                .init(string: "https://rickandmortyapi.com/api/episode/8")!,
                .init(string: "https://rickandmortyapi.com/api/episode/9")!,
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/11")!,
                .init(string: "https://rickandmortyapi.com/api/episode/12")!,
                .init(string: "https://rickandmortyapi.com/api/episode/13")!,
                .init(string: "https://rickandmortyapi.com/api/episode/14")!,
                .init(string: "https://rickandmortyapi.com/api/episode/15")!,
                .init(string: "https://rickandmortyapi.com/api/episode/16")!,
                .init(string: "https://rickandmortyapi.com/api/episode/17")!,
                .init(string: "https://rickandmortyapi.com/api/episode/18")!,
                .init(string: "https://rickandmortyapi.com/api/episode/19")!,
                .init(string: "https://rickandmortyapi.com/api/episode/20")!,
                .init(string: "https://rickandmortyapi.com/api/episode/21")!,
                .init(string: "https://rickandmortyapi.com/api/episode/22")!,
                .init(string: "https://rickandmortyapi.com/api/episode/23")!,
                .init(string: "https://rickandmortyapi.com/api/episode/24")!,
                .init(string: "https://rickandmortyapi.com/api/episode/25")!,
                .init(string: "https://rickandmortyapi.com/api/episode/26")!,
                .init(string: "https://rickandmortyapi.com/api/episode/27")!,
                .init(string: "https://rickandmortyapi.com/api/episode/28")!,
                .init(string: "https://rickandmortyapi.com/api/episode/29")!,
                .init(string: "https://rickandmortyapi.com/api/episode/30")!,
                .init(string: "https://rickandmortyapi.com/api/episode/31")!,
                .init(string: "https://rickandmortyapi.com/api/episode/32")!,
                .init(string: "https://rickandmortyapi.com/api/episode/33")!,
                .init(string: "https://rickandmortyapi.com/api/episode/34")!,
                .init(string: "https://rickandmortyapi.com/api/episode/35")!,
                .init(string: "https://rickandmortyapi.com/api/episode/36")!,
                .init(string: "https://rickandmortyapi.com/api/episode/37")!,
                .init(string: "https://rickandmortyapi.com/api/episode/38")!,
                .init(string: "https://rickandmortyapi.com/api/episode/39")!,
                .init(string: "https://rickandmortyapi.com/api/episode/40")!,
                .init(string: "https://rickandmortyapi.com/api/episode/41")!,
                .init(string: "https://rickandmortyapi.com/api/episode/42")!,
                .init(string: "https://rickandmortyapi.com/api/episode/43")!,
                .init(string: "https://rickandmortyapi.com/api/episode/44")!,
                .init(string: "https://rickandmortyapi.com/api/episode/45")!,
                .init(string: "https://rickandmortyapi.com/api/episode/46")!,
                .init(string: "https://rickandmortyapi.com/api/episode/47")!,
                .init(string: "https://rickandmortyapi.com/api/episode/48")!,
                .init(string: "https://rickandmortyapi.com/api/episode/49")!,
                .init(string: "https://rickandmortyapi.com/api/episode/50")!,
                .init(string: "https://rickandmortyapi.com/api/episode/51")!
            ]
        ),
        .init(
            id: 3,
            name: "Summer Smith",
            species: "Human",
            type: "",
            gender: "Female",
            origin: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/6")!,
                .init(string: "https://rickandmortyapi.com/api/episode/7")!,
                .init(string: "https://rickandmortyapi.com/api/episode/8")!,
                .init(string: "https://rickandmortyapi.com/api/episode/9")!,
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/11")!,
                .init(string: "https://rickandmortyapi.com/api/episode/12")!,
                .init(string: "https://rickandmortyapi.com/api/episode/14")!,
                .init(string: "https://rickandmortyapi.com/api/episode/15")!,
                .init(string: "https://rickandmortyapi.com/api/episode/16")!,
                .init(string: "https://rickandmortyapi.com/api/episode/17")!,
                .init(string: "https://rickandmortyapi.com/api/episode/18")!,
                .init(string: "https://rickandmortyapi.com/api/episode/19")!,
                .init(string: "https://rickandmortyapi.com/api/episode/20")!,
                .init(string: "https://rickandmortyapi.com/api/episode/21")!,
                .init(string: "https://rickandmortyapi.com/api/episode/22")!,
                .init(string: "https://rickandmortyapi.com/api/episode/23")!,
                .init(string: "https://rickandmortyapi.com/api/episode/24")!,
                .init(string: "https://rickandmortyapi.com/api/episode/25")!,
                .init(string: "https://rickandmortyapi.com/api/episode/26")!,
                .init(string: "https://rickandmortyapi.com/api/episode/27")!,
                .init(string: "https://rickandmortyapi.com/api/episode/29")!,
                .init(string: "https://rickandmortyapi.com/api/episode/30")!,
                .init(string: "https://rickandmortyapi.com/api/episode/31")!,
                .init(string: "https://rickandmortyapi.com/api/episode/32")!,
                .init(string: "https://rickandmortyapi.com/api/episode/33")!,
                .init(string: "https://rickandmortyapi.com/api/episode/34")!,
                .init(string: "https://rickandmortyapi.com/api/episode/35")!,
                .init(string: "https://rickandmortyapi.com/api/episode/36")!,
                .init(string: "https://rickandmortyapi.com/api/episode/38")!,
                .init(string: "https://rickandmortyapi.com/api/episode/39")!,
                .init(string: "https://rickandmortyapi.com/api/episode/40")!,
                .init(string: "https://rickandmortyapi.com/api/episode/41")!,
                .init(string: "https://rickandmortyapi.com/api/episode/42")!,
                .init(string: "https://rickandmortyapi.com/api/episode/43")!,
                .init(string: "https://rickandmortyapi.com/api/episode/44")!,
                .init(string: "https://rickandmortyapi.com/api/episode/45")!,
                .init(string: "https://rickandmortyapi.com/api/episode/46")!,
                .init(string: "https://rickandmortyapi.com/api/episode/47")!,
                .init(string: "https://rickandmortyapi.com/api/episode/48")!,
                .init(string: "https://rickandmortyapi.com/api/episode/49")!,
                .init(string: "https://rickandmortyapi.com/api/episode/51")!
            ]
        ),
        .init(
            id: 4,
            name: "Beth Smith",
            species: "Human",
            type: "",
            gender: "Female",
            origin: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/4.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/6")!,
                .init(string: "https://rickandmortyapi.com/api/episode/7")!,
                .init(string: "https://rickandmortyapi.com/api/episode/8")!,
                .init(string: "https://rickandmortyapi.com/api/episode/9")!,
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/11")!,
                .init(string: "https://rickandmortyapi.com/api/episode/12")!,
                .init(string: "https://rickandmortyapi.com/api/episode/14")!,
                .init(string: "https://rickandmortyapi.com/api/episode/15")!,
                .init(string: "https://rickandmortyapi.com/api/episode/16")!,
                .init(string: "https://rickandmortyapi.com/api/episode/18")!,
                .init(string: "https://rickandmortyapi.com/api/episode/19")!,
                .init(string: "https://rickandmortyapi.com/api/episode/20")!,
                .init(string: "https://rickandmortyapi.com/api/episode/21")!,
                .init(string: "https://rickandmortyapi.com/api/episode/22")!,
                .init(string: "https://rickandmortyapi.com/api/episode/23")!,
                .init(string: "https://rickandmortyapi.com/api/episode/24")!,
                .init(string: "https://rickandmortyapi.com/api/episode/25")!,
                .init(string: "https://rickandmortyapi.com/api/episode/26")!,
                .init(string: "https://rickandmortyapi.com/api/episode/27")!,
                .init(string: "https://rickandmortyapi.com/api/episode/28")!,
                .init(string: "https://rickandmortyapi.com/api/episode/29")!,
                .init(string: "https://rickandmortyapi.com/api/episode/30")!,
                .init(string: "https://rickandmortyapi.com/api/episode/31")!,
                .init(string: "https://rickandmortyapi.com/api/episode/32")!,
                .init(string: "https://rickandmortyapi.com/api/episode/33")!,
                .init(string: "https://rickandmortyapi.com/api/episode/34")!,
                .init(string: "https://rickandmortyapi.com/api/episode/35")!,
                .init(string: "https://rickandmortyapi.com/api/episode/36")!,
                .init(string: "https://rickandmortyapi.com/api/episode/38")!,
                .init(string: "https://rickandmortyapi.com/api/episode/39")!,
                .init(string: "https://rickandmortyapi.com/api/episode/40")!,
                .init(string: "https://rickandmortyapi.com/api/episode/41")!,
                .init(string: "https://rickandmortyapi.com/api/episode/42")!,
                .init(string: "https://rickandmortyapi.com/api/episode/43")!,
                .init(string: "https://rickandmortyapi.com/api/episode/44")!,
                .init(string: "https://rickandmortyapi.com/api/episode/45")!,
                .init(string: "https://rickandmortyapi.com/api/episode/46")!,
                .init(string: "https://rickandmortyapi.com/api/episode/47")!,
                .init(string: "https://rickandmortyapi.com/api/episode/48")!,
                .init(string: "https://rickandmortyapi.com/api/episode/49")!,
                .init(string: "https://rickandmortyapi.com/api/episode/51")!
            ]
        ),
        .init(
            id: 5,
            name: "Jerry Smith",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/5.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/6")!,
                .init(string: "https://rickandmortyapi.com/api/episode/7")!,
                .init(string: "https://rickandmortyapi.com/api/episode/8")!,
                .init(string: "https://rickandmortyapi.com/api/episode/9")!,
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/11")!,
                .init(string: "https://rickandmortyapi.com/api/episode/12")!,
                .init(string: "https://rickandmortyapi.com/api/episode/13")!,
                .init(string: "https://rickandmortyapi.com/api/episode/14")!,
                .init(string: "https://rickandmortyapi.com/api/episode/15")!,
                .init(string: "https://rickandmortyapi.com/api/episode/16")!,
                .init(string: "https://rickandmortyapi.com/api/episode/18")!,
                .init(string: "https://rickandmortyapi.com/api/episode/19")!,
                .init(string: "https://rickandmortyapi.com/api/episode/20")!,
                .init(string: "https://rickandmortyapi.com/api/episode/21")!,
                .init(string: "https://rickandmortyapi.com/api/episode/22")!,
                .init(string: "https://rickandmortyapi.com/api/episode/23")!,
                .init(string: "https://rickandmortyapi.com/api/episode/26")!,
                .init(string: "https://rickandmortyapi.com/api/episode/29")!,
                .init(string: "https://rickandmortyapi.com/api/episode/30")!,
                .init(string: "https://rickandmortyapi.com/api/episode/31")!,
                .init(string: "https://rickandmortyapi.com/api/episode/32")!,
                .init(string: "https://rickandmortyapi.com/api/episode/33")!,
                .init(string: "https://rickandmortyapi.com/api/episode/35")!,
                .init(string: "https://rickandmortyapi.com/api/episode/36")!,
                .init(string: "https://rickandmortyapi.com/api/episode/38")!,
                .init(string: "https://rickandmortyapi.com/api/episode/39")!,
                .init(string: "https://rickandmortyapi.com/api/episode/40")!,
                .init(string: "https://rickandmortyapi.com/api/episode/41")!,
                .init(string: "https://rickandmortyapi.com/api/episode/42")!,
                .init(string: "https://rickandmortyapi.com/api/episode/43")!,
                .init(string: "https://rickandmortyapi.com/api/episode/44")!,
                .init(string: "https://rickandmortyapi.com/api/episode/45")!,
                .init(string: "https://rickandmortyapi.com/api/episode/46")!,
                .init(string: "https://rickandmortyapi.com/api/episode/47")!,
                .init(string: "https://rickandmortyapi.com/api/episode/48")!,
                .init(string: "https://rickandmortyapi.com/api/episode/49")!,
                .init(string: "https://rickandmortyapi.com/api/episode/50")!,
                .init(string: "https://rickandmortyapi.com/api/episode/51")!
            ]
        ),
        .init(
            id: 6,
            name: "Abadango Cluster Princess",
            species: "Alien",
            type: "",
            gender: "Female",
            origin: .init(
                name: "Abadango",
                url: .init(string: "https://rickandmortyapi.com/api/location/2")
            ),
            location: .init(
                name: "Abadango",
                url: .init(string: "https://rickandmortyapi.com/api/location/2")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/6.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/27")!
            ]
        ),
        .init(
            id: 7,
            name: "Abradolf Lincler",
            species: "Human",
            type: "Genetic experiment",
            gender: "Male",
            origin: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            location: .init(
                name: "Testicle Monster Dimension",
                url: .init(string: "https://rickandmortyapi.com/api/location/21")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/7.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/11")!
            ]
        ),
        .init(
            id: 8,
            name: "Adjudicator Rick",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Citadel of Ricks",
                url: .init(string: "https://rickandmortyapi.com/api/location/3")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/8.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/28")!
            ]
        ),
        .init(
            id: 9,
            name: "Agency Director",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/9.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/24")!
            ]
        ),
        .init(
            id: 10,
            name: "Alan Rails",
            species: "Human",
            type: "Superhuman (Ghost trains summoner)",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Worldender's lair",
                url: .init(string: "https://rickandmortyapi.com/api/location/4")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/10.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/25")!
            ]
        ),
        .init(
            id: 11,
            name: "Albert Einstein",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "Earth (C-137)",
                url: .init(string: "https://rickandmortyapi.com/api/location/1")
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/11.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/12")!
            ]
        ),
        .init(
            id: 12,
            name: "Alexander",
            species: "Human",
            type: "",
            gender: "Male",
            origin: .init(
                name: "Earth (C-137)",
                url: .init(string: "https://rickandmortyapi.com/api/location/1")
            ),
            location: .init(
                name: "Anatomy Park",
                url: .init(string: "https://rickandmortyapi.com/api/location/5")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/12.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/3")!
            ]
        ),
        .init(
            id: 13,
            name: "Alien Googah",
            species: "Alien",
            type: "",
            gender: "unknown",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/13.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/31")!
            ]
        ),
        .init(
            id: 14,
            name: "Alien Morty",
            species: "Alien",
            type: "",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Citadel of Ricks",
                url: .init(string: "https://rickandmortyapi.com/api/location/3")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/14.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/10")!
            ]
        ),
        .init(
            id: 15,
            name: "Alien Rick",
            species: "Alien",
            type: "",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Citadel of Ricks",
                url: .init(string: "https://rickandmortyapi.com/api/location/3")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/15.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/10")!
            ]
        ),
        .init(
            id: 16,
            name: "Amish Cyborg",
            species: "Alien",
            type: "Parasite",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Earth (Replacement Dimension)",
                url: .init(string: "https://rickandmortyapi.com/api/location/20")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/16.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/15")!
            ]
        ),
        .init(
            id: 17,
            name: "Annie",
            species: "Human",
            type: "",
            gender: "Female",
            origin: .init(
                name: "Earth (C-137)",
                url: .init(string: "https://rickandmortyapi.com/api/location/1")
            ),
            location: .init(
                name: "Anatomy Park",
                url: .init(string: "https://rickandmortyapi.com/api/location/5")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/17.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/3")!
            ]
        ),
        .init(
            id: 18,
            name: "Antenna Morty",
            species: "Human",
            type: "Human with antennae",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Citadel of Ricks",
                url: .init(string: "https://rickandmortyapi.com/api/location/3")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/18.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/10")!,
                .init(string: "https://rickandmortyapi.com/api/episode/28")!
            ]
        ),
        .init(
            id: 19,
            name: "Antenna Rick",
            species: "Human",
            type: "Human with antennae",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "unknown",
                url: nil
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/19.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/10")!
            ]
        ),
        .init(
            id: 20,
            name: "Ants in my Eyes Johnson",
            species: "Human",
            type: "Human with ants in his eyes",
            gender: "Male",
            origin: .init(
                name: "unknown",
                url: nil
            ),
            location: .init(
                name: "Interdimensional Cable",
                url: .init(string: "https://rickandmortyapi.com/api/location/6")
            ),
            imageUrl: .init(string: "https://rickandmortyapi.com/api/character/avatar/20.jpeg")!,
            episodeUrls: [
                .init(string: "https://rickandmortyapi.com/api/episode/8")!
            ]
        )
    ]
}
#endif
