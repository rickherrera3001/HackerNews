//
//  DataBase.swift
//  HackerNewsRM
//
//  Created by Ricardo Developer on 09/04/24.
//

import Foundation
import SwiftData



@Model
class ModelDatabase {
    
    @Relationship() let highlightResult: HighlightResult
    @Attribute let author: String
    
    let storyID: Int
    let storyTitle: String?
    let updatedAt: String?
    let storyURL: String?
    let title: String?
    let storyText: String?
    
    init(highlightResult: HighlightResult, 
         author: String,
         storyID: Int,
         storyTitle: String?,
         updatedAt: String?,
         storyURL: String?,
         title: String?,
         storyText: String?) {
        self.highlightResult = highlightResult
        self.author = author
        self.storyID = storyID
        self.storyTitle = storyTitle
        self.updatedAt = updatedAt
        self.storyURL = storyURL
        self.title = title
        self.storyText = storyText
    }
    
    
    @Model
    class HighlightResult {
        let author: Author?
        let commentText: Author?
        let storyTitle: Author?
        let storyURL: Author?
        let title: Author?
        let url: Author?
        let storyText: Author?
        
        init(author: Author, 
             commentText: Author?,
             storyTitle: Author?,
             storyURL: Author?,
             title: Author?,
             url: Author?,
             storyText: Author?) {
            self.author = author
            self.commentText = commentText
            self.storyTitle = storyTitle
            self.storyURL = storyURL
            self.title = title
            self.url = url
            self.storyText = storyText
        }
    }
}




