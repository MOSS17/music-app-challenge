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
    
    @ObservedObject var vm = ArtistDetailsViewModel(apiService: APIManager())
    
    var body: some View {
        ZStack {
            GradientBackground(color: bgColor)
            ScrollView {
                VStack {
                    ImageView(urlString: artist.images.first?.url, backgroundColor: $bgColor)
                        .frame(width: K.Size.detailsImage, height: K.Size.detailsImage)
                        .cornerRadius(K.Size.detailsCornerRadius)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(artist.name)
                            .font(.system(size: K.FontSize.header, weight: .bold))
                        HStack(spacing: K.Spacing.inner) {
                            ForEach(artist.genres.prefix(K.Limit.genres), id: \.self) { genre in
                                GenreTag(genre: genre)
                            }
                            Spacer()
                        }
                        Text("\(artist.followers.total) followers")
                            .lineLimit(1)
                            .padding(.top, K.Spacing.inner)
                    }
                    .padding()
                    AlbumList(albums: $vm.albumsResponse.items)
                }
                .padding(.top, K.Spacing.headerImage)
                .foregroundStyle(.white)
            }
        }
        .task {
            await vm.fetchArtistAlbums(artistId: artist.id)
        }
    }
}

#Preview {
    ArtistDetailsView(artist: .constant(Artist.mockedData.first!))
}
