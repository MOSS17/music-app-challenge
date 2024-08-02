//
//  AlbumList.swift
//  MusicApp
//
//  Created by Miguel Sandoval on 01/08/24.
//

import SwiftUI

struct AlbumList: View {
    @Binding var albums: [Album]
    
    var body: some View {
        VStack(spacing: K.Spacing.content) {
            ForEach(albums, id: \.id) { album in
                    HStack(spacing: K.Spacing.content) {
                        ImageView(urlString: album.images.first?.url, backgroundColor: .constant(.primary))
                            .frame(width: K.Size.listImage, height: K.Size.listImage)
                            .cornerRadius(K.Size.cornerRadius)
                        VStack(alignment: .leading, spacing: K.Spacing.inner) {
                            Text(album.name)
                                .font(.title2)
                                .bold()
                                .lineLimit(3)
                            Text(album.releaseDate.prefix(4))
                        }
                        Spacer()
                    }
                    .foregroundStyle(.white)
                
            }
        }
        .padding(.all)
    }
}
