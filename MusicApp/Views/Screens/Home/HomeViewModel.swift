//
//  HomeViewModel.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

class HomeViewModel: ObservableObject { 
    func fetchArtists() async -> Artists {
        guard let url = (URL(string: "https://api.spotify.com/v1/artists/?ids=2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6")) else {
            print("URL didn't work")
            return Artists.empty
        }
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "GET"
        let token = "BQBrNN1__lvpstDhXVmI9ghVHOfANxXUwCH7Dio1gfnbbEXK-_Hg5PPfvpgn157d3AUzPD3mHh5lFMCwjUuXiinGFc13lykd55iDYmnM0r75ivpo30c"
        apiRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
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
