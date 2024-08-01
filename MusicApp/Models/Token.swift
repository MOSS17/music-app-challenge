//
//  Token.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import Foundation

class Token: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int 
}
