//
//  ArtistDetailsViewModel.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

class ArtistDetailsViewModel: ObservableObject {
    @Published var albumsResponse: AlbumResponse = AlbumResponse(items: [])
    @Published var relatedArtists: ArtistResponse = ArtistResponse(artists: [])
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchArtistAlbums(artistId: String) async {
        apiService.fetchArtistAlbums(artistId: artistId) { result in
            switch result {
            case .success(let albums):
                self.albumsResponse = albums
            case .failure:
                print(result)
                self.albumsResponse = AlbumResponse(items: [])
            }
        }
    }
    
    func fetchRelatedArtists(artistId: String) async {
        apiService.fetchRelatedArtists(artistId: artistId) { result in
            switch result {
            case .success(let artists):
                self.relatedArtists = artists
            case .failure:
                print(result)
                self.relatedArtists = ArtistResponse(artists: [])
            }
        }
    }
}
