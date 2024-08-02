//
//  RelatedArtists.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

struct RelatedArtists: View {
    @Binding var artists: [Artist]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: K.Spacing.content) {
                ForEach(artists, id: \.id) { artist in
                    NavigationLink(destination: ArtistDetailsView(artist: .constant(artist))) {
                        VStack(spacing: K.Spacing.content) {
                            ImageView(urlString: artist.images.first?.url, backgroundColor: .constant(.primary))
                                .frame(width: K.Size.listImage, height: K.Size.listImage)
                                .clipShape(Circle())
                                Text(artist.name)
                                    .font(.title2)
                                    .bold()
                                    .frame(maxWidth: K.Size.listImage)
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
            .padding(.all)
        }
    }
}
