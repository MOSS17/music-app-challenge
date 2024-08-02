//
//  Album.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

struct Album: Codable {
    let id: String
    let name: String
    let images: [ImageObject]
    let releaseDate: String
    let totalTracks: Int
}

struct AlbumResponse: Codable {
    var items: [Album]
}
