//
//  ContentView.swift
//  BookFace
//
//  Created by Jan Kaltoun on 01.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 4) {
                    Text("bookface")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .font(.largeTitle)
                        .foregroundColor(.init(red: 0.09, green: 0.47, blue: 0.95))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                    
                    ForEach(posts) { post in
                        PostView(post: post)
                    }
                }
                .background(Color(red: 0.77, green: 0.78, blue: 0.8))
            }
        }
    }
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(post.author)
                    .fontWeight(.semibold)
                
                Text(post.text)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(uiImage: post.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            
            Divider()
            
            HStack {
                Button {
                    print("Like")
                } label: {
                    HStack {
                        Image(systemName: "hand.thumbsup")
                        Text("Like")
                    }
                }
                .buttonStyle(PostButtonStyle())
                
                Button {
                    print("Comment")
                } label: {
                    HStack {
                        Image(systemName: "bubble.left")
                        Text("Comment")
                    }
                }
                .buttonStyle(PostButtonStyle())
                
                Button {
                    print("Share")
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                    }
                }
                .buttonStyle(PostButtonStyle())
            }
        }
        .padding(8)
        .background(Color.white)
    }
}

struct PostButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .font(.subheadline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
