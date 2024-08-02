//
//  APIManager.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

protocol APIService {
    func requestAndSaveToken(completion: @escaping (Result<Bool, any Error>) -> Void)
    func fetchArtists(completion: @escaping (Result<ArtistResponse, Error>) -> Void)
    func fetchRelatedArtists(artistId: String, completion: @escaping (Result<ArtistResponse, Error>) -> Void)
    func fetchArtistAlbums(artistId: String, completion: @escaping (Result<AlbumResponse, Error>) -> Void)
}

class APIManager: APIService {
    func requestAndSaveToken(completion: @escaping (Result<Bool, any Error>) -> Void) {
        let requestHeaders: [String:String] = ["Authorization": SPOTIFY_API_AUTH_KEY, "Content-Type": "application/x-www-form-urlencoded"]
        
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "client_credentials"),
            URLQueryItem(name: "redirect_uri", value: "google.com")
        ]
        
        guard let url = (URL(string: SpotifyEndpoints.token.rawValue)) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let token = try decoder.decode(Token.self, from: data)
                KeychainWrapper.standard.set(token.accessToken, forKey: "token")
                completion(.success(true))
            } catch {
                completion(.failure(NetworkError.failedToDecodeResponse))
            }
        }.resume()
    }
    
    func fetchArtists(completion: @escaping (Result<ArtistResponse, any Error>) -> Void) {
        guard let url = (URL(string: SpotifyEndpoints.artists.rawValue)) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "GET"
        let token = KeychainWrapper.standard.string(forKey: "token")
        apiRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: apiRequest) { data, res, error in
            
            guard let response = res as? HTTPURLResponse else { return completion(.failure(NetworkError.badResponse)) }
            guard response.statusCode >= 200 && response.statusCode < 300 else { return completion(.failure(NetworkError.badStatus)) }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            DispatchQueue.main.async {
                if let artistResponse = try? JSONDecoder().decode(ArtistResponse.self, from: data) {
                    completion(.success(artistResponse))
                } else {
                    completion(.failure(NetworkError.failedToDecodeResponse))
                }
            }
        }.resume()
    }
    
    func fetchRelatedArtists(artistId: String, completion: @escaping (Result<ArtistResponse, any Error>) -> Void) {
        guard let url = (URL(string: "\(SpotifyEndpoints.albums.rawValue)\(artistId)/related-artists")) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "GET"
        let token = KeychainWrapper.standard.string(forKey: "token")
        apiRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: apiRequest) { data, res, error in
            
            guard let response = res as? HTTPURLResponse else { return completion(.failure(NetworkError.badResponse)) }
            guard response.statusCode >= 200 && response.statusCode < 300 else { return completion(.failure(NetworkError.badStatus)) }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            DispatchQueue.main.async {
                if let artistResponse = try? JSONDecoder().decode(ArtistResponse.self, from: data) {
                    completion(.success(artistResponse))
                } else {
                    completion(.failure(NetworkError.failedToDecodeResponse))
                }
            }
        }.resume()
    }
    
    func fetchArtistAlbums(artistId: String, completion: @escaping (Result<AlbumResponse, any Error>) -> Void) {
        guard let url = (URL(string: "\(SpotifyEndpoints.albums.rawValue)\(artistId)/albums?limit=\(K.Limit.albums)")) else {
            completion(.failure(NetworkError.badUrl))
            return
        }

        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "GET"
        let token = KeychainWrapper.standard.string(forKey: "token")
        apiRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: apiRequest) { data, res, error in
            guard let response = res as? HTTPURLResponse else { return completion(.failure(NetworkError.badResponse)) }
            guard response.statusCode >= 200 && response.statusCode < 300 else { return completion(.failure(NetworkError.badStatus)) }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let albumsResponse = try? decoder.decode(AlbumResponse.self, from: data) {
                    completion(.success(albumsResponse))
                } else {
                    completion(.failure(NetworkError.failedToDecodeResponse))
                }
            }
        }.resume()
    }
}
