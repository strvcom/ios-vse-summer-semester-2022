//
//  WebRenderingView.swift
//  RickAndMorty
//
//  Created by Jan Schwarz on 31.03.2022.
//

import SwiftUI
import WebKit

struct WebRenderingView: UIViewRepresentable {
    let url: URL
    @Binding var isLoaded: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        let request = URLRequest(url: url)
        webView.load(request)
        webView.navigationDelegate = context.coordinator
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        coordinator.parent = self
        return coordinator
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebRenderingView?
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent?.isLoaded = true
        }
    }
}
