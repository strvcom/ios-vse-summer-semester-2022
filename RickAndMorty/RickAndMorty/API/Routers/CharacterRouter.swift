//
//  CharacterRouter.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 28.04.2022.
//

import Foundation

enum CharacterRouter {
    case getCharacters(page: Int?)
    case getCharacter(id: Character.ID)
}

extension CharacterRouter: Endpoint {
    // Example
    // https://rickandmortyapi.com/api/character?page=1

    var path: String {
        switch self {
        case .getCharacters:
            return "character"
        case .getCharacter(let id):
            return "character/\(id)"
        }
    }
    
    var urlParamaters: [String : Any]? {
        switch self {
        case let .getCharacters(.some(page)):
            return ["page": page]
        case .getCharacter:
            return nil
        case .getCharacters(page: .none):
            return nil
        }
    }
    
}
