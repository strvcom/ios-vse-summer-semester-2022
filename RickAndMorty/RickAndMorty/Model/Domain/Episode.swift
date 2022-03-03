//
//  Episode.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

struct Episode {
    let id: Int
    let name: String
    let code: String
    let airDate: Date
    let characterIds: [Int]
}

// MARK - Date Formatter
extension Episode {
    static let airDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter
    }()
}

// MARK: - Conformances
extension Episode: Identifiable {}
extension Episode: Equatable {}

// MARK: - Mock
#if DEBUG
extension Episode {
    static let mock: Episode = .init(
        id: 1,
        name: "Pilot",
        code: "S01E01",
        airDate: Date(),
        characterIds: [1, 2]
    )
}
#endif
