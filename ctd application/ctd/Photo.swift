//
//  Photo.swift
//  ios101-project6-tumblr
//
//  Created by Fakiya Imangaliyeva on 4/22/24.
//

import Foundation
class Photo {
    var originalSize: PhotoSize
    
    init(originalSize: PhotoSize) {
        self.originalSize = originalSize
    }
}

class PhotoSize {
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
}
