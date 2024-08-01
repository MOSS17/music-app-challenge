//
//  Artist.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 30/07/24.
//

import Foundation

struct Artist: Codable, Equatable {
    let id: String
    let name: String
    let images: [ImageObject]
    let genres: [String]
    let followers: FollowersObject
}

struct ArtistResponse: Codable {
    var artists: [Artist]
}
