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
    
    func fetchArtistAlbums(artistId: String) {
        apiService.fetchArtistAlbums(artistId: artistId) { result in
            switch result {
            case .success(let albums):
                DispatchQueue.main.async {
                    self.albumsResponse = albums
                }
            case .failure:
                print(result)
                DispatchQueue.main.async {
                    self.albumsResponse = AlbumResponse(items: [])
                }
            }
        }
    }
    
    func fetchRelatedArtists(artistId: String) {
        apiService.fetchRelatedArtists(artistId: artistId) { result in
            switch result {
            case .success(let artists):
                DispatchQueue.main.async {
                    self.relatedArtists = artists
                }
            case .failure:
                print(result)
                DispatchQueue.main.async {
                    self.relatedArtists = ArtistResponse(artists: [])
                }
            }
        }
    }
}
