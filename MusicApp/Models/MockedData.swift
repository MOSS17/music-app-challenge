//
//  MockedData.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

extension Artist {
    static let mockedData: [Artist] = [
        Artist(id: "4Z8W4fKeB5YxbusRsdQVPb", name: "John", images: [ImageObject(height: 200, url: "https://static.wikia.nocookie.net/duckbreeds/images/0/04/CallDuckHeadshot.jpg/revision/latest?cb=20100823210932", width: 200)], genres: ["art rock", "alternative rock", "Mac", "SC"], followers: FollowersObject(href: nil, total: 10)),
        Artist(id: "2", name: "Doe", images: [], genres: ["art rock", "alternative rock", "Mac", "SC"], followers: FollowersObject(href: nil, total: 10)),
    ]
}

extension ArtistResponse {
    static let empty = ArtistResponse(artists: [])
}

extension Album {
    static let mockedData: [Album] = [
    Album(id: "1", name: "Best Album", images: [], releaseDate: "2023-02-24", totalTracks: 10),
    Album(id: "2", name: "Worst Album", images: [], releaseDate: "2023-12-25", totalTracks: 2),
    Album(id: "3", name: "Middle Album", images: [], releaseDate: "2020-02-24", totalTracks: 8),
    ]
}
