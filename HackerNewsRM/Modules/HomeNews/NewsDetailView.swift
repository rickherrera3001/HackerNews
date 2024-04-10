//
//  NewsDetailView.swift
//  HackerNewsRM
//
//  Created by Ricardo Developer on 08/04/24.
//

import SwiftUI

struct NewsItem: Identifiable{
    
    let id: String
    let title: String
    let author: String
    let content: String
    

}

let newsItem = NewsItem(id: "1", title: "Titulo de la noticia", author: "Autor de la noticia", content: "contenido de la noticia...")

struct NewsDetailView: View {
    
    let newsItem: Hit
    
    var body: some View {
        VStack{
        NewsView(url: newsItem.storyURL ?? "www.google.com")
        }
        .padding()
            .navigationTitle(newsItem.author)
    }
}

import WebKit

struct WebView: UIViewRepresentable {
    let url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
            
            webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
        
    }
    
    struct NewsView: View {
        var url : String
        var body : some View {
            WebView(url: URL(string: url)!)
                .edgesIgnoringSafeArea(.all)
        }
    }


/*#Preview {
    NewsDetailView()
}*/
