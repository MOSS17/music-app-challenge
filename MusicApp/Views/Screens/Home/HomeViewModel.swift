//
//  HomeViewModel.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var artistResponse: ArtistResponse = ArtistResponse(artists: [])
    @Published var token: String?
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchAndSaveToken() {
        apiService.requestAndSaveToken { result in
            switch result {
            case .success(_):
                print("token has been saved")
                DispatchQueue.main.async {
                    self.token = KeychainWrapper.standard.string(forKey: "token")
                }
                return
            case .failure:
                print(result)
                DispatchQueue.main.async {
                    self.token = nil
                }
                return
            }
        }
    }
    
    func fetchArtists() {
        apiService.fetchArtists { result in
            switch result {
            case .success(let artists):
                DispatchQueue.main.async {
                    self.artistResponse = artists
                }
            case .failure:
                DispatchQueue.main.async {
                    self.artistResponse = ArtistResponse(artists: [])
                }
            }
        }
    }
}
