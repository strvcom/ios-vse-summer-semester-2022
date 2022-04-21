//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 10.03.2022.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var store = CharacterListStore()
    
    @State var mode: Mode = .list
    
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
        .navigationTitle("Characters")
        .onFirstAppear(perform: load)
        .toolbar {
            ToolbarItem {
                Button(action: toggleMode) {
                    mode.image
                }
            }
        }
    }
    
    @ViewBuilder var content: some View {
        ScrollView {
            switch mode {
            case .list:
                listContent
            case .grid:
                gridContent
            }
        }
    }
    
    @ViewBuilder var listContent: some View {
        LazyVStack {
            ForEach(store.characters) { character in
                NavigationLink(
                    destination: CharacterDetailView(
                        store: CharacterDetailStore(character: character)
                    )
                ) {
                    CharacterListRowItemView(character: character)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder var gridContent: some View {
        Text("Co teď? 🤔")
    }
}

// MARK: - Actions
extension CharacterListView {
    func load() {
        Task {
            await store.load()
        }
    }

    func toggleMode() {
        mode.toggle()
        
//        if mode == .list {
//            mode = .grid
//        } else if mode == .grid {
//            mode = .list
//        }
        
//        switch mode {
//        case .list:
//            mode = .grid
//        case .grid:
//            mode = .list
//        }
    }
}

// MARK: - Mode
extension CharacterListView {
    enum Mode {
        case list
        case grid
        
        var image: Image {
            switch self {
            case .list:
                return Image(systemName: "square.grid.3x3")
            case .grid:
                return Image(systemName: "list.dash")
            }
        }
        
        mutating func toggle() {
            switch self {
            case .list:
                self = .grid
            case .grid:
                self = .list
            }
        }
    }
}

// MARK: - Previews
struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
