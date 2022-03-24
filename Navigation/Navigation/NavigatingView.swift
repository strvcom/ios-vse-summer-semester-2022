//
//  NavigatingView.swift
//  Navigation
//
//  Created by Jan Kaltoun on 23.03.2022.
//

import SwiftUI

struct NavigatingView: View {
    var body: some View {
        NavigationView {
            FirstView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

fileprivate struct FirstView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.top)
            
            NavigationLink(
                destination: SecondView()
            ) {
                Text("Push second view")
            }
        }
        .navigationTitle("First view")
    }
}

fileprivate struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 16) {
                NavigationLink(
                    destination: FirstView()
                ) {
                    Text("Push first view")
                }
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Go back")
                }
            }
        }
        .navigationTitle("Second view")
    }
}
