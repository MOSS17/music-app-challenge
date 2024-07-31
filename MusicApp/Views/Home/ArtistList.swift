//
//  ArtistListView.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 31/07/24.
//

import SwiftUI

struct ArtistList: View {
    var exampleArtists = [
        Artist(id: "1", name: "John", images: [ImageObject(height: 200, url: "https://static.wikia.nocookie.net/duckbreeds/images/0/04/CallDuckHeadshot.jpg/revision/latest?cb=20100823210932", width: 200)], genres: ["art rock", "alternative rock", "Mac", "SC"], followers: FollowersObject(href: nil, total: 10)),
        Artist(id: "2", name: "Doe", images: [], genres: ["art rock", "alternative rock", "Mac", "SC"], followers: FollowersObject(href: nil, total: 10)),
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(exampleArtists) { artist in
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
        ArtistList()
    }
}

struct ArtistImage: View {
    let image: ImageObject?
    var body: some View {
        if let imageUrl = image {
            AsyncImage(url: URL(string: imageUrl.url), transaction: .init(animation: .bouncy(duration: 1))) { phase in
                if let image = phase.image {
                    image.resizable()
                        .cornerRadius(20)
                } else if phase.error != nil {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                } else {
                    ProgressView().progressViewStyle(.circular)
                }
            }
        } else {
            RoundedRectangle(cornerRadius: 30)
                .fill(.gray)
        }
    }
}
