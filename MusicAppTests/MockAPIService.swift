//
//  MockAPIService.swift
//  MusicAppTests
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation
@testable import MusicApp

class MockAPIService: APIService {
    func requestAndSaveToken(completion: @escaping (Result<Bool, any Error>) -> Void) {
        completion(.success(true))
    }
    
    func fetchArtists(completion: @escaping (Result<ArtistResponse, any Error>) -> Void) {
        completion(.success(ArtistResponse(artists: Artist.mockedData)))
    }
    
    func fetchRelatedArtists(artistId: String, completion: @escaping (Result<ArtistResponse, any Error>) -> Void) {
        completion(.success(ArtistResponse(artists: Artist.mockedData)))
    }
    
    func fetchArtistAlbums(artistId artistsId: String, completion: @escaping (Result<AlbumResponse, any Error>) -> Void) {
        completion(.success(AlbumResponse(items: Album.mockedData)))
    }
}

class MockAPIFailService: APIService {
    func requestAndSaveToken(completion: @escaping (Result<Bool, any Error>) -> Void) {
        completion(.failure(NetworkError.noData))
    }
    
    func fetchArtists(completion: @escaping (Result<ArtistResponse, any Error>) -> Void) {
        completion(.failure(NetworkError.noData))
    }
    
    func fetchRelatedArtists(artistId: String, completion: @escaping (Result<ArtistResponse, any Error>) -> Void) {
        completion(.failure(NetworkError.noData))
    }
    
    func fetchArtistAlbums(artistId artistsId: String, completion: @escaping (Result<AlbumResponse, any Error>) -> Void) {
        completion(.failure(NetworkError.noData))
    }
}
