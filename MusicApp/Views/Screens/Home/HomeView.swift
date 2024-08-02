//
//  ContentView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 29/07/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel(apiService: APIManager())
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                GradientBackground(color: .blue)
                if vm.token == nil {
                    Text("Unable to get token. Check secrets keys.")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            HomeHeader()
                                .padding()
                            ArtistList(artists: $vm.artistResponse.artists)
                        }
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
        .accentColor(.white)
        .onAppear {
            vm.fetchAndSaveToken()
            vm.fetchArtists()
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
    HomeView()
}
