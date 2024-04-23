//
//  Post.swift
//  ios101-project6-tumblr
//

import Foundation

class Post {
    var summary: String
    var photos: [Photo]
    var caption: String  // Adding a caption property

    init(summary: String, photos: [Photo], caption: String) {
        self.summary = summary
        self.photos = photos
        self.caption = caption  // Initialize the caption
    }
}

class Column {
    var photos: [Photo]
    var text: String  // Text specific to this column
    
    init(photos: [Photo], text: String) {
        self.photos = photos
        self.text = text
    }
}
