//
//  Artist.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 30/07/24.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let images: [ImageObject]
    let genres: [String]
    let followers: FollowersObject
}

struct Artists: Codable {
    var artists: [Artist]
}
