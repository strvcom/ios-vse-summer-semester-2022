//
//  EpisodesRouter.swift
//  RickAndMorty
//
//  Created by Tomas Cejka on 05.05.2022.
//

import Foundation

enum EpisodesRouter {
    case getEpisode(id: Episode.ID)
}

extension EpisodesRouter: Endpoint {
    var path: String {
        switch self {
        case .getEpisode(let id):
            return "episode/\(id)"
        }
    }
    
    var urlParamaters: [String : Any]? {
        nil
    }
}
