//
//  ContentView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 29/07/24.
//

import SwiftUI

struct HomeView: View {
    @State var artists: Artists
    
    @State var vm = HomeViewModel()
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                GradientBackground(color: .blue)
                ScrollView {
                    VStack(alignment: .leading) {
                        HomeHeader()
                            .padding()
                        ArtistList(artists: $artists.artists)
                    }
                }
            }
        }
        .task {
            artists = await vm.fetchArtists()
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

enum NetworkError: Error {  // 2
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

#Preview {
    HomeView(artists: Artists(artists: []))
}
