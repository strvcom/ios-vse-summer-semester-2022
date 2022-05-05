//
//  CharacterDetailStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 21.04.2022.
//

import Foundation

@MainActor final class CharacterDetailStore: ObservableObject {
    enum State {
        case initial
        case loading
        case finished
        case failed
    }

    @Published var state: State = .initial
    @Published var character: Character
    @Published var episodes: [Episode] = .init()
    
    private lazy var apiManager = APIManager()

    init(character: Character) {
        self.character = character
    }
}

// MARK: - Actions
extension CharacterDetailStore {
    func load() async {
        state = .loading
        
        await fetchCharacter(with: character.id)
        await fetchEpisodes()
    }
}

// MARK: - Fetching
private extension CharacterDetailStore {
    func fetchCharacter(with id: Character.ID) async {
        let endpoint = CharacterRouter.getCharacter(id: id)
        
        do {
            character = try await apiManager.request(endpoint)
            state = .finished
        } catch {
            Logger.log("\(error)", .error)
            state = .failed
        }
    }
    
    func fetchEpisodes() async {
        do {
            try await withThrowingTaskGroup(of: Episode.self) { [weak self] group in
                guard let self = self else {
                    return
                }
                
                for episodeId in character.episodeIds {
                    group.addTask {
                        let endpoint = EpisodesRouter.getEpisode(id: episodeId)
                        
                        return try await self.apiManager.request(endpoint)
                    }
                }
                
                var episodes: [Episode] = .init()
                
                for try await episode in group {
                    episodes.append(episode)
                }
                
                self.episodes = episodes
            }
        } catch {
            Logger.log("\(error)", .error)
            // List of episodes is not *that* important, so we'll ignore any errors
        }
    }
}
