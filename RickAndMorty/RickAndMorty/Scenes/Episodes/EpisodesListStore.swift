//
//  EpisodesListStore.swift
//  RickAndMorty
//
//  Created by Martin Vidovic on 21.04.2022.
//

import Foundation

@MainActor final class EpisodesListStore: ObservableObject {
    enum State {
        case initial
        case loading
        case finished
        case failed
    }

    @Published var state: State = .initial
    @Published var episodes: [Episode] = .init()
}

// MARK: - Actions
extension EpisodesListStore {
    func load() async {
        state = .loading
        
        do {
            // wait 2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_000)
            episodes = [Episode.mock]
            state = .finished
        } catch {
            state = .failed
        }
    }
}
