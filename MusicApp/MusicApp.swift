//
//  MusicApp.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 29/07/24.
//

import SwiftUI

@main
struct MusicApp: App {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
