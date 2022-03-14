//
//  CharacterListRowItemView.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 10.03.2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterListRowItemView: View {
    let character: Character
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            WebImage(url: character.imageUrl)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 110, height: 110)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.appItemLargeTitle)
                    .foregroundColor(.appTextItemTitle)
                    .multilineTextAlignment(.leading)
                
                Text("\(character.species) • \(character.gender)")
                    .font(.appItemDescription)
            }
            .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CharacterListRowItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListRowItemView(
            character: Character.mock
        )
    }
}
