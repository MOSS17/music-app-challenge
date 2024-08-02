//
//  ArtistDetailsView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

struct ArtistDetailsView: View {
    @Binding var artist: Artist
    @State private var bgColor: Color = .blue
    
    var body: some View {
        ZStack {
            GradientBackground(color: bgColor)
            ScrollView {
                VStack {
                    ImageView(urlString: artist.images.first?.url, backgroundColor: $bgColor)
                        .frame(width: K.Size.detailsImage, height: K.Size.detailsImage)
                        .cornerRadius(K.Size.detailsCornerRadius)
                    VStack(alignment: .leading) {
                        Text(artist.name)
                            .font(.system(size: K.FontSize.header, weight: .bold))
                        HStack {
                            ForEach(artist.genres.prefix(K.Limit.genres), id: \.self) { genre in
                                GenreTag(genre: genre)
                            }
                        }
                    }
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ArtistDetailsView(artist: .constant(Artist.mockedData.first!))
}
