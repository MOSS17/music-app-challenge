//
//  Auth.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

struct Auth {
    static let shared: Auth = Auth()
    
    func requestToken() async {
        let requestHeaders: [String:String] = ["Authorization": SPOTIFY_API_AUTH_KEY, "Content-Type": "application/x-www-form-urlencoded"]
        
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "client_credentials"),
            URLQueryItem(name: "redirect_uri", value: "google.com")
        ]
        
        guard let url = (URL(string: SpotifyEndpoints.token.rawValue)) else {
            print("URL didn't work")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("No data")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let token = try decoder.decode(Token.self, from: data)
                KeychainWrapper.standard.set(token.accessToken, forKey: "token")
            } catch {
                print("Error trying to decode")
            }
        }.resume()
    }
}
