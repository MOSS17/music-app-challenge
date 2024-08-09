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
        if artists.isEmpty {
            Text("No artists available, try restarting the app")
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
        } else {
            VStack(spacing: K.Spacing.content) {
                ForEach(artists, id: \.id) { artist in
                    NavigationLink(destination: ArtistDetailsView(artist: .constant(artist))) {
                        HStack(spacing: K.Spacing.content) {
                            ImageView(urlString: artist.images.first?.url, backgroundColor: .constant(.primary))
                                .frame(width: K.Size.listImage, height: K.Size.listImage)
                                .cornerRadius(K.Size.cornerRadius)
                            VStack(alignment: .leading, spacing: K.Spacing.inner) {
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
            }
            .padding(.all)
        }
    }
}

#Preview {
    ZStack {
        GradientBackground(color: .blue)
        ArtistList(artists: .constant([]))
    }
}

