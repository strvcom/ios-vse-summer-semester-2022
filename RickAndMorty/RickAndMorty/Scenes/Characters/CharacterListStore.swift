//
//  CharacterListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 21.04.2022.
//

import Foundation

@MainActor final class CharacterListStore: ObservableObject {
    enum State {
        case initial
        case loading
        case finished
        case failed
    }

    @Published var state: State = .initial
    @Published var characters: [Character] = .init()
    
    private lazy var apiManager = APIManager()
    private var currentResponseInfo: PaginationInfo? = nil
}

// MARK: Actions
extension CharacterListStore {
    func load() async {
        state = .loading

        await fetch()
    }
    
    func loadMoreIfNeed(for character: Character) async {
        guard character == characters.last else {
            return
        }
        
        guard let nextPageNumber = currentResponseInfo?.nextPageNumber else {
            return
        }
        
        // TODO: finish state changes
        await fetch(page: nextPageNumber)
    }
}

// MARK: Fetching
private extension CharacterListStore {
    func fetch(page: Int? = nil) async {
        let endpoint = CharacterRouter.getCharacters(page: page)
        
        do {
            
            let response: PaginatedResponse<Character> = try await apiManager.request(endpoint)
            characters += response.results
            currentResponseInfo = response.info
            
            state = .finished
            
        } catch {
            Logger.log("\(error)", .error)
            state = .failed
        }
    }
}
