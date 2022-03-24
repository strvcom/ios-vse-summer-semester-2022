//
//  ContentView.swift
//  Navigation
//
//  Created by Jan Kaltoun on 23.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SwitchingView()
                .tabItem {
                    Label(
                        "Switching views",
                        systemImage: "arrow.left.arrow.right.square"
                    )
                }
            
            NavigatingView()
                .tabItem {
                    Label(
                        "Navigation View",
                        systemImage: "arrow.right.square"
                    )
                }
            
            PresentingView()
                .tabItem {
                    Label(
                        "Modal Presentation",
                        systemImage: "arrow.up.square"
                    )
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
