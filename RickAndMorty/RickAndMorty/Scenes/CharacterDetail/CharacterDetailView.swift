//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Nick Beresnev on 3/17/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetailView: View {
    let character: Character
    let episodes: [Episode]
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            
            ScrollView {
                VStack(spacing: 16) {
                    WebImage(url: character.imageUrl)
                        .resizable()
                        .placeholder {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    infoSection
                    
                    episodesSection
                }
            }
            .padding(.horizontal, 8)
        }
        .navigationTitle(character.name)
    }
}

private extension CharacterDetailView {
    var infoSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Info")
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            
            HStack(alignment: .top) {
                VStack(alignment: .horizontalInfoAlignment, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "creditcard")
                        
                        Text(character.name)
                            .alignmentGuide(.horizontalInfoAlignment, computeValue: { $0[.leading]} )
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "person.fill.questionmark")
                        
                        Text(character.species)
                            .alignmentGuide(.horizontalInfoAlignment, computeValue: { $0[.leading]} )
                    }
                    
                    if !character.type.isEmpty {
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "person.fill.viewfinder")
                            
                            Text(character.type)
                                .alignmentGuide(.horizontalInfoAlignment, computeValue: { $0[.leading]} )
                        }
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "person.and.arrow.left.and.arrow.right")
                        
                        Text(character.gender)
                            .alignmentGuide(.horizontalInfoAlignment, computeValue: { $0[.leading]} )
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "globe")
                        
                        Text(character.origin.name)
                    }
                    
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "eyes")
                        
                        Text(character.location.name)
                    }
                }
            }
        }
            .font(.appItemDescription)
    }
    
    var episodesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Episodes")
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            
            LazyVStack(spacing: 8) {
                ForEach(episodes) { episode in
                    HStack {
                        Text(episode.name)
                        
                        Spacer()
                        
                        Text(episode.code)
                    }
                    .font(.appItemDescription)
                    .padding()
                    .background(Color.appBackgroundItem)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(
            character: Character.mock,
            episodes: Episode.mockList
        )
    }
}
