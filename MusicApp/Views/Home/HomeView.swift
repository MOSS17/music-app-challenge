//
//  ContentView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 29/07/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            GradientBackground(color: .blue)
            ScrollView {
                VStack(alignment: .leading) {
                    HomeHeader()
                        .padding()
                    ArtistList()
                }
            }
        }
    }
    
    fileprivate struct HomeHeader: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("This is")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundStyle(.white)
                Text("You")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HomeView()
}
