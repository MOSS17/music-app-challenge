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
        VStack(spacing: K.Spacing.contentSpacing) {
            ForEach(artists, id: \.id) { artist in
                HStack(spacing: K.Spacing.contentSpacing) {
                    ArtistImage(image: artist.images.first)
                        .frame(width: K.Size.listImage, height: K.Size.listImage)
                    VStack(alignment: .leading, spacing: K.Spacing.innerSpacing) {
                        Text(artist.name)
                            .font(.title2)
                            .bold()
                        HStack {
                            ForEach(artist.genres.prefix(K.Limit.genres), id: \.self) { genre in
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

