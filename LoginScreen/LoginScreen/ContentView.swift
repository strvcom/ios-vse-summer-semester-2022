//
//  ContentView.swift
//  LoginScreen
//
//  Created by Jan Schwarz on 31.03.2022.
//

import SwiftUI

struct ContentView: View {
    var parent: LoginViewController?
    
    var body: some View {
        Button("Log Out") {
            logOut()
        }
    }
    
    private func logOut() {
        parent?.dismissContent()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
