//
//  SwitchingView.swift
//  Navigation
//
//  Created by Jan Kaltoun on 23.03.2022.
//

import SwiftUI

struct SwitchingView: View {
    enum Screen {
        case first
        case second
        
        mutating func toggle() {
            switch self {
            case .first:
                self = .second
            case .second:
                self = .first
            }
        }
    }
    
    @State var screen: Screen = .first
    
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    screen.toggle()
                }
            } label: {
                Text("Switch")
            }
            
            switch screen {
            case .first:
                FirstView(screen: $screen)
                    .transition(.slide)
            case .second:
                SecondView(screen: $screen)
                    .transition(.slide)
            }
        }
    }
}

fileprivate struct FirstView: View {
    @Binding var screen: SwitchingView.Screen
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 16) {
                Text("First view")
                
                Button {
                    withAnimation {
                        screen.toggle()
                    }
                } label: {
                    Text("Switch")
                }
            }
        }
    }
}

fileprivate struct SecondView: View {
    @Binding var screen: SwitchingView.Screen
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 16) {
                Text("Second view")
                
                Button {
                    withAnimation {
                        screen.toggle()
                    }
                } label: {
                    Text("Switch")
                }
            }
        }
    }
}
