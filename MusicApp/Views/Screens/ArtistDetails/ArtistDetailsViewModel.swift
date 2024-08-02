//
//  ArtistDetailsViewModel.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

class ArtistDetailsViewModel: ObservableObject {
    @Published var albumsResponse: AlbumResponse = AlbumResponse(items: [])
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchArtistAlbums(artistId: String) async {
        apiService.fetchArtistAlbums(artistsId: artistId) { result in
            switch result {
            case .success(let albums):
                self.albumsResponse = albums
                
            case .failure:
                print(result)
                self.albumsResponse = AlbumResponse(items: [])
            }
        }
    }
}
