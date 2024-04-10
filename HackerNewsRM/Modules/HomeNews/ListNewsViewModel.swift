//
//  ListNewsViewModel.swift
//  HackerNewsRM
//
//  Created by Ricardo Developer on 03/04/24.
//

import Foundation
import Combine
import SwiftData

class ListNewsViewModel: ObservableObject {
    let apiClient = ApiClient()
    
    @Published var news: News?
    @Published var error: Error?
    @Published var modelDatabase : [ModelDatabase]?
    private var cancellables = Set <AnyCancellable>()
    
    let container = try! ModelContainer(for: ModelDatabase.self)
    
    @MainActor
    var modelContex: ModelContext {
        container.mainContext
    }
    //var modelDatabase: [ModelDatabase] = []
    
    @MainActor
    func getDatabaseNews(){
        let fetchDescriptor = FetchDescriptor<ModelDatabase>(predicate: nil,
                                                             sortBy: [SortDescriptor<ModelDatabase>(\.author)])
        
        
        
        modelDatabase = try! modelContex.fetch(fetchDescriptor)
        print(modelDatabase)
    }
    
    @MainActor
    func insert(news: ModelDatabase){
        modelContex.insert(news)
        modelDatabase = []
        getDatabaseNews()
    }
    
    /*@MainActor
    func deleteAllNews() {
        modelDatabase?.forEach{
            modelContex.delete($0)
        }
        modelDatabase = []
        getDatabaseNews()
    }*/
    
    func performGetNews() {
        
        apiClient.getNews { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let news):
                    self.news = news
                    self.error = nil
                case .failure(let error): self.news = nil
                    self.error = error
                }
            }
            
        }
    }
    
}



