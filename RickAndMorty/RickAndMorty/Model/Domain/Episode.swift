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
    
    var rottenTomatoesUrl: URL? {
        let codeParts = code.dropFirst().split(separator: "E")
        
        guard
            codeParts.count == 2,
            let serieNumber = codeParts.first,
            let episodeNumber = codeParts.last
        else {
            return nil
        }
        
        let urlString = "https://www.rottentomatoes.com/tv/rick_and_morty/s\(serieNumber)/e\(episodeNumber)"
        
        return URL(string: urlString)
    }
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
    static let mock: Episode = Self.mockList.first!
    
    static let mockList: [Episode] = [
        .init(
            id: 1,
            name: "Pilot",
            code: "S01E01",
            airDate: .init(timeIntervalSince1970: 1385938800),
            characterIds: [1, 2, 35, 38, 62, 92, 127, 144, 158, 175, 179, 181, 239, 249, 271, 338, 394, 395, 435]
        ),
        .init(
            id: 2,
            name: "Lawnmower Dog",
            code: "S01E02",
            airDate: .init(timeIntervalSince1970: 1386543600),
            characterIds: [1, 2, 38, 46, 63, 80, 175, 221, 239, 246, 304, 305, 306, 329, 338, 396, 397, 398, 405]
        ),
        .init(
            id: 3,
            name: "Anatomy Park",
            code: "S01E03",
            airDate: .init(timeIntervalSince1970: 1387148400),
            characterIds: [1, 2, 12, 17, 38, 45, 96, 97, 98, 99, 100, 101, 108, 112, 114, 169, 175, 186, 201, 268, 300, 302, 338, 356]
        ),
        .init(
            id: 4,
            name: "M. Night Shaym-Aliens!",
            code: "S01E04",
            airDate: .init(timeIntervalSince1970: 1389567600),
            characterIds: [1, 2, 38, 87, 175, 179, 181, 191, 239, 241, 270, 337, 338]
        ),
        .init(
            id: 5,
            name: "Meeseeks and Destroy",
            code: "S01E05",
            airDate: .init(timeIntervalSince1970: 1390172400),
            characterIds: [1, 2, 38, 41, 89, 116, 117, 120, 175, 193, 238, 242, 271, 303, 326, 333, 338, 343, 399, 400]
        ),
        .init(
            id: 6,
            name: "Rick Potion #9",
            code: "S01E06",
            airDate: .init(timeIntervalSince1970: 1390777200),
            characterIds: [1, 2, 3, 4, 5, 38, 58, 82, 83, 92, 155, 175, 179, 181, 216, 234, 239, 249, 251, 271, 293, 338, 343, 394]
        ),
        .init(
            id: 7,
            name: "Raising Gazorpazorp",
            code: "S01E07",
            airDate: .init(timeIntervalSince1970: 1394406000),
            characterIds: [1, 2, 3, 4, 5, 59, 151, 168, 211, 230, 258, 329, 376, 401]
        ),
        .init(
            id: 8,
            name: "Rixty Minutes",
            code: "S01E08",
            airDate: .init(timeIntervalSince1970: 1395010800),
            characterIds: [1, 2, 3, 4, 5, 20, 28, 29, 34, 37, 54, 88, 91, 129, 134, 136, 145, 153, 157, 176, 183, 184, 195, 207, 214, 222, 250, 266, 277, 279, 314, 315, 316, 317, 318, 351, 358, 367, 370, 373, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418]
        ),
        .init(
            id: 9,
            name: "Something Ricked This Way Comes",
            code: "S01E09",
            airDate: .init(timeIntervalSince1970: 1395615600),
            characterIds: [1, 2, 3, 4, 5, 88, 192, 240, 243, 251, 272, 307, 419, 420, 421, 422, 826]
        ),
        .init(
            id: 10,
            name: "Close Rick-counters of the Rick Kind",
            code: "S01E10",
            airDate: .init(timeIntervalSince1970: 1396821600),
            characterIds: [1, 2, 3, 4, 5, 7, 14, 15, 18, 19, 21, 22, 27, 39, 53, 77, 78, 79, 82, 83, 84, 85, 86, 103, 113, 118, 119, 152, 164, 177, 209, 215, 232, 242, 274, 290, 294, 295, 298, 299, 329, 330, 339, 349, 359, 381, 389, 405, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 663]
        )
    ]
}
#endif
