//
//  HomeViewModel.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var artistResponse: ArtistResponse = ArtistResponse(artists: [])
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchAndSaveToken() async {
        apiService.requestAndSaveToken { result in
            switch result {
            case .success(_):
                print("token has been saved")
            case .failure:
                print("error saving token")
            }
        }
    }
    
    func fetchArtists() async {
        apiService.fetchArtists { result in
            switch result {
            case .success(let artists):
                self.artistResponse = artists
            case .failure:
                self.artistResponse = ArtistResponse(artists: [])
            }
        }
    }
}
