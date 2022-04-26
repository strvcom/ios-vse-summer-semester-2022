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
}

// MARK: Actions
extension CharacterListStore {
    func load() async {
        state = .loading

        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            characters = Character.mockList
            state = .finished
        } catch {
            state = .failed
        }
    }
}
