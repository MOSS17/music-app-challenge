//
//  ContentView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 29/07/24.
//

import SwiftUI

struct HomeView: View {
    @State var artists = Artists(artists: [])
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
            await Auth.shared.requestToken()
            artists = await vm.fetchArtists()
        }
    }
    
    fileprivate struct HomeHeader: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("This is")
                    .font(.system(size: K.FontSize.header, weight: .bold))
                    .foregroundStyle(.white)
                Text("You")
                    .font(.system(size: K.FontSize.header, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
    }
   
}

#Preview {
    HomeView(artists: Artists(artists: []))
}
