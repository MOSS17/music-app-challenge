//
//  Endpoints.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

enum SpotifyEndpoints: String {
    case token = "https://accounts.spotify.com/api/token"
    case artists = "https://api.spotify.com/v1/artists/?ids=1McMsnEElThX1knmY4oliG,246dkjvS1zLTtiykXe5h60,6M2wZ9GZgrQXHCFfjv46we,5pKCCKE2ajJHZ9KAiaK11H,0EmeFodog0BfCgMzAIvKQp,7dGJo4pcD2V6oG8kP0tJRR,6qqNVTkY8uBg9cP3Jd7DAH,4dpARuHxo51G3z768sgnrY,53XhwfbYqKCa1cC15pYq2q,26VFTg2z8YR0cCuwLzESi2,3Nrfpe0tUJi4K4DXYWgMUX"
    case albums = "https://api.spotify.com/v1/artists/"
}
