//
//  HomeViewModel.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    func fetchArtists() async -> Artists {
        guard let url = (URL(string: SpotifyEndpoints.artists.rawValue)) else {
            print("URL didn't work")
            return Artists.empty
        }
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "GET"
        let token = KeychainWrapper.standard.string(forKey: "token")
        apiRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, result) = try await URLSession.shared.data(for: apiRequest)
            guard let response = result as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(Artists.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            return decodedResponse
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occurred downloading the data")
        }
        
        return Artists.empty
    }
}
