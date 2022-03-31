//
//  EpisodesListView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 15.03.2022.
//

import SwiftUI

struct EpisodesListView: View {
    let episodes = Episode.mockList
    
    @State private var presentedRottenTomatoesEpisode: Episode?
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            content
        }
        .navigationTitle("Episodes")
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
                    ForEach(episodes) { episode in
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
