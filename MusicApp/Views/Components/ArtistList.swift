//
//  ArtistListView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 31/07/24.
//

import SwiftUI

struct ArtistList: View {
    @Binding var artists: [Artist]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(artists, id: \.id) { artist in
                HStack(spacing: 30) {
                    ArtistImage(image: artist.images.first)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(artist.name)
                            .font(.title2)
                            .bold()
                        HStack {
                            ForEach(artist.genres.prefix(3), id: \.self) { genre in
                                GenreTag(genre: genre)
                            }
                        }
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
            }
        }
        .padding(.all)
    }
}

#Preview {
    ZStack {
        GradientBackground(color: .blue)
        ArtistList(artists: .constant(Artist.mockedData))
    }
}

