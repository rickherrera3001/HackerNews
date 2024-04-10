//
//  ContentView.swift
//  HackerNewsRM
//
//  Created by Ricardo Developer on 03/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
   
    
    var body: some View {
        VStack {
            ListNewsView()
        }
        .padding()
    }
}

/*#Preview {
    ContentView()
}*/
