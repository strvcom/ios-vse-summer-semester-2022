//
//  WebView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 31.03.2022.
//

import SwiftUI

struct WebView: View {
    let url: URL
    @State private var isLoaded = false
    
    var body: some View {
        ZStack {
            WebRenderingView(url: url, isLoaded: $isLoaded)
            
            if !isLoaded {
                ProgressView()
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: Episode.mock.rottenTomatoesUrl!)
    }
}
