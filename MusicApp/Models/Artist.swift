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

struct FollowersObject: Codable {
    let href: String?
    let total: Int
}

struct ImageObject: Codable {
    let height: Int
    let url: String
    let width: Int
}
