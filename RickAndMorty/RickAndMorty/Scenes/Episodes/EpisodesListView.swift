//
//  EpisodesListView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 15.03.2022.
//

import SwiftUI

struct EpisodesListView: View {
    @StateObject var store = EpisodesListStore()
    
    @State private var presentedRottenTomatoesEpisode: Episode?
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            switch store.state {
            case .finished:
                content
            case .initial, .loading:
                ProgressView()
            case .failed:
                Text("🥲🥲🥲 Something went wrong")
            }
        }
        .navigationTitle("Episodes")
        .onFirstAppear(perform: load)
        .sheet(item: $presentedRottenTomatoesEpisode) { episode in
            if let url = episode.rottenTomatoesUrl {
                WebView(url: url)
            } else {
                webViewError
            }
        }
    }
    
    @ViewBuilder var content: some View {
        ScrollView {
            Group {
                LazyVStack {
                    ForEach(store.episodes) { episode in
                        EpisodesListItemView(episode: episode)
                            .onTapGesture {
                                presentRottenTomatoes(for: episode)
                            }
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
    
    @ViewBuilder var webViewError: some View {
        ZStack {
            BackgroundGradientView()
            
            Text("Something went wrong 😭")
        }
    }
}

// MARK: - Actions
extension EpisodesListView {
    func load() {
        Task {
            await store.load()
        }
    }
}

private extension EpisodesListView {
    func presentRottenTomatoes(for episode: Episode) {
        presentedRottenTomatoesEpisode = episode
    }
}

// MARK: - Previews
struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesListView()
    }
}
