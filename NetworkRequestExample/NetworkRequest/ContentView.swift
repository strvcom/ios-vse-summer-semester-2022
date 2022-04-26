//
//  ContentView.swift
//  NetworkRequest
//
//  Created by Jan Kaltoun on 25.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var results = [SearchResult]()
    
    var body: some View {
        NavigationView {
            List(results) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.trackName)
                        .font(.headline)
                    
                    Text(item.collectionName)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Song search")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            print("Will search...")
            await search()
            print("Did search...")
        }
    }
}

extension ContentView {
    func search() async {
        print("Searching...")
        
        // Create request
        guard var components = URLComponents(string: "https://itunes.apple.com/search") else {
            assertionFailure("Invalid base URL")
            
            return
        }
        
        components.queryItems = [
            URLQueryItem(name: "term", value: "Taylor+Swift"),
            URLQueryItem(name: "entity", value: "song")
        ]
        
        guard let url = components.url else {
            assertionFailure("Malformed URL")
            
            return
        }
        
        // Make request
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
//            debugPrint(String(data: data, encoding: .utf8))
            
            // Decode data
            let decoder = JSONDecoder()
            
            guard let response = try? decoder.decode(SearchResponse.self, from: data) else {
                assertionFailure("Could not decode data")
                
                return
            }
            
            results = response.results
        } catch {
            assertionFailure("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
