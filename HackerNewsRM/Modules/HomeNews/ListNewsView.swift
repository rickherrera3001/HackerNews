//
//  ListNewsView.swift
//  HackerNewsRM
//
//  Created by Ricardo Developer on 03/04/24.
//

import SwiftUI



struct ListNewsView: View {
    @StateObject var viewModel = ListNewsViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if let news = viewModel.news {
                    
                    List {
                        ForEach(news.hits, id: \.objectID) {
                            item in NavigationLink(destination: NewsDetailView(newsItem: item)) {
                                Text ("\(item.author)")
                               
                            }
                        }
                        .onDelete(perform: deleteNews)
                    }
                    .refreshable {
                        viewModel.performGetNews()
                    }
                    
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                } else {
                    ProgressView()
                    
            
                    
                }
                
            }
            .navigationBarTitle("Hacker News")
            .onAppear {
                viewModel.performGetNews()
                
            }
            
        }
        
    }
    
    func deleteNews(at offSet: IndexSet) {
        viewModel.news?.hits.remove(atOffsets: offSet)
        
        
    }
    
}
     
    
    
    
    
    
    #Preview {
        ListNewsView()
    }
