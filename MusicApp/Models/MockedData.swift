//
//  MockedData.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

extension Artist {
    static let mockedData: [Artist] = [
        Artist(id: "1", name: "John", images: [ImageObject(height: 200, url: "https://static.wikia.nocookie.net/duckbreeds/images/0/04/CallDuckHeadshot.jpg/revision/latest?cb=20100823210932", width: 200)], genres: ["art rock", "alternative rock", "Mac", "SC"], followers: FollowersObject(href: nil, total: 10)),
        Artist(id: "2", name: "Doe", images: [], genres: ["art rock", "alternative rock", "Mac", "SC"], followers: FollowersObject(href: nil, total: 10)),
    ]
}

extension Artists {
    static let empty = Artists(artists: [])
}
